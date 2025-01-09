const connection = require('../models/db');

const processFollowers = async (list_id, client_account, kategori, platform, username, date) => {
    try {
        // **Langkah 1: Isi Nilai Followers**
        // Ambil data followers dari tabel users
        const [followersData] = await connection.query(`
            SELECT followers
            FROM users
            WHERE client_account = ? AND kategori = ? AND platform = ? AND username = ?
        `, [client_account, kategori, platform, username]);

        // Proses data followers
        const followers = followersData.length > 0 ? followersData[0].followers : 0;

        // Update kolom followers saja terlebih dahulu
        await connection.query(`
            UPDATE dailyFairScores
            SET IFNULL(followers = ?)
            WHERE list_id = ? AND client_account = ? AND kategori = ? AND platform = ? AND username = ?
        `, [followers, list_id, client_account, kategori, platform, username]);

        console.info(`Updated followers for ${username} on ${date}`);
    } catch (error) {
        console.error(`Error updating followers for ${username} on ${date}:`, error.message);
        return;
    }

    try {
        // **Langkah 2: Hitung Followers Score dan Bobot**
        // Ambil nilai followers maksimal per grup
        const [maxFollowersData] = await connection.query(`
            SELECT 
                client_account, kategori, platform, date, MAX(followers) AS max_followers
            FROM dailyFairScores
            WHERE client_account = ? AND kategori = ? AND platform = ? AND date = ?
            GROUP BY client_account, kategori, platform, date
        `, [client_account, kategori, platform, date]);

        const maxFollowers = maxFollowersData.length > 0 ? maxFollowersData[0].max_followers : 1; // Hindari pembagian dengan nol

        // Hitung followers_score dan followers_bobot
        let followers_score = followers / maxFollowers;
        if (isNaN(followers_score)) {
            followers_score = 0;
        }
        const followers_bobot = followers_score * 2;

        // Update kolom followers_score dan followers_bobot
        await connection.query(`
            UPDATE dailyFairScores
            SET IFNULL(followers_score = ?), IFNULL(followers_bobot = ?)
            WHERE list_id = ? AND client_account = ? AND kategori = ? AND platform = ? AND username = ? AND date = ?
        `, [followers_score, followers_bobot, list_id, client_account, kategori, platform, username, date]);

        console.info(`Processed followers score for ${username} on ${date}`);
    } catch (error) {
        console.error(`Error processing followers score for ${username} on ${date}:`, error.message);
    }
};

const processActivities = async (list_id, client_account, kategori, platform, username, date) => {
    try {
        // Ambil jumlah activities untuk username tertentu
        const [activitiesData] = await connection.query(`
            SELECT COUNT(post_id) AS activities
            FROM posts
            WHERE client_account = ? AND kategori = ? AND platform = ? AND username = ? AND DATE(created_at) = ?
        `, [client_account, kategori, platform, username, date]);

        const activities = activitiesData.length > 0 ? activitiesData[0].activities : 0;

        // Cari nilai max_activities dalam kombinasi grup
        const [maxActivitiesData] = await connection.query(`
            SELECT MAX(activities) AS max_activities
            FROM dailyFairScores
            WHERE client_account = ? AND kategori = ? AND platform = ? AND date = ?
        `, [client_account, kategori, platform, date]);

        const maxActivities = maxActivitiesData.length > 0 ? maxActivitiesData[0].max_activities : 1; // Default ke 1 untuk menghindari pembagian nol

        // Hitung activities_score
        let activities_score = activities / maxActivities;
        if (isNaN(activities_score)) {
            activities_score = 0;
        }
        const activities_bobot = activities_score * 2;

        // Update tabel dailyFairScores dengan hasil pemrosesan
        const updateSql = `
            UPDATE dailyFairScores
            SET IFNULL(activities = ?), IFNULL(activities_score = ?), IFNULL(activities_bobot = ?)
            WHERE list_id = ? AND client_account = ? AND kategori = ? AND platform = ? AND username = ? AND date = ?
        `;
        await connection.query(updateSql, [activities, activities_score, activities_bobot, list_id, client_account, kategori, platform, username, date]);

        console.info(`Processed activities data for ${username} on ${date}`);
    } catch (error) {
        console.error(`Error processing activities data for ${username} on ${date}:`, error.message);
    }
};

const processInteraction = async (list_id, client_account, kategori, platform, username, date) => {
    try {
        // Ambil data interaction dari tabel posts
        const [interactionData] = await connection.query(`
            SELECT AVG(likes) AS interaction
            FROM posts
            WHERE client_account = ? AND kategori = ? AND platform = ? AND username = ? AND DATE(created_at) = ?
        `, [client_account, kategori, platform, username, date]);

        // Proses data interaction
        const interaction = interactionData.length > 0 ? interactionData[0].interaction : 0;

        // Cari nilai interaction maksimal dari username dengan kelompok yang sama
        const [maxInteractionData] = await connection.query(`
            SELECT MAX(interaction) AS max_interaction
            FROM dailyFairScores
            WHERE client_account = ? AND kategori = ? AND platform = ? date = ?
        `, [client_account, kategori, platform, date]);

        const maxInteraction = maxInteractionData.length > 0 ? maxInteractionData[0].max_interaction : 1; // Hindari pembagian dengan nol

        // Hitung interaction_score dan interaction_bobot
        let interaction_score = interaction / maxInteraction;
        if (isNaN(interaction_score)) {
            interaction_score = 0;
        }
        const interaction_bobot = interaction_score * 2;

        // Update tabel dailyFairScores dengan hasil pemrosesan
        const updateSql = `
            UPDATE dailyFairScores
            SET IFNULL(interaction = ?), IFNULL(interaction_score = ?), IFNULL(interaction_bobot = ?)
            WHERE list_id = ? AND client_account = ? AND kategori = ? AND platform = ? AND username = ? AND date = ?
        `;
        await connection.query(updateSql, [interaction, interaction_score, interaction_bobot, list_id, client_account, kategori, platform, username, date]);

        console.info(`Processed interaction data for ${username} on ${date}`);
    } catch (error) {
        console.error(`Error processing interaction data for ${username} on ${date}:`, error.message);
    }
};

const processResponsiveness = async (list_id, client_account, kategori, platform, username, date) => {
    try {
        // Ambil data responsiveness dari tabel mainComments dan childComments
        const [responsivenessData] = await connection.query(`
            SELECT 
                CASE 
                    WHEN COALESCE(SUM(
                        (SELECT COUNT(*) FROM mainComments mc WHERE mc.unique_id_post = p.unique_id_post) +
                        (SELECT COUNT(*) FROM childComments cc WHERE cc.unique_id_post = p.unique_id_post)
                    ), 0) - COALESCE(SUM(
                        (SELECT COUNT(*) FROM mainComments mc WHERE mc.commenter_username = ? AND mc.unique_id_post = p.unique_id_post) +
                        (SELECT COUNT(*) FROM childComments cc WHERE cc.child_commenter_username = ? AND cc.unique_id_post = p.unique_id_post)
                    ), 0) > 0
                    THEN COALESCE(SUM(
                        (SELECT COUNT(*) FROM mainComments mc WHERE mc.commenter_username = ? AND mc.unique_id_post = p.unique_id_post) +
                        (SELECT COUNT(*) FROM childComments cc WHERE cc.child_commenter_username = ? AND cc.unique_id_post = p.unique_id_post)
                    ), 0) / (
                        COALESCE(SUM(
                            (SELECT COUNT(*) FROM mainComments mc WHERE mc.unique_id_post = p.unique_id_post) +
                            (SELECT COUNT(*) FROM childComments cc WHERE cc.unique_id_post = p.unique_id_post)
                        ), 0) - COALESCE(SUM(
                            (SELECT COUNT(*) FROM mainComments mc WHERE mc.commenter_username = ? AND mc.unique_id_post = p.unique_id_post) +
                            (SELECT COUNT(*) FROM childComments cc WHERE cc.child_commenter_username = ? AND cc.unique_id_post = p.unique_id_post)
                        ), 0)
                    )
                    ELSE 0
                END AS responsiveness
            FROM posts p
            WHERE p.client_account = ? AND p.kategori = ? AND p.platform = ? AND p.username = ? AND DATE(p.created_at) = ?;
        `, [
            username, username, // commenter_username & child_commenter_username
            username, username, // commenter_username & child_commenter_username (untuk bagian kedua)
            username, username, // commenter_username & child_commenter_username (untuk pengurangan total)
            client_account, kategori, platform, username, date // Filter utama
        ]);

        // Proses data responsiveness
        const responsiveness = responsivenessData.length > 0 ? responsivenessData[0].total_comments_by_username : 0;

        // Cari nilai responsiveness maksimal dari grup yang sama
        const [maxResponsivenessData] = await connection.query(`
            SELECT MAX(responsiveness) AS max_responsiveness
            FROM dailyFairScores
            WHERE client_account = ? AND kategori = ? AND platform = ? AND date = ?
        `, [client_account, kategori, platform, date]);

        const maxResponsiveness = maxResponsivenessData.length > 0 ? maxResponsivenessData[0].max_responsiveness : 1; // Hindari pembagian dengan nol

        // Hitung responsiveness_score dan responsiveness_bobot
        let responsiveness_score = responsiveness / maxResponsiveness;
        if (isNaN(responsiveness_score)) {
            responsiveness_score = 0;
        }
        const responsiveness_bobot = responsiveness_score * 2;

        // Update tabel dailyFairScores dengan hasil pemrosesan
        const updateSql = `
            UPDATE dailyFairScores
            SET IFNULL(responsiveness = ?), IFNULL(responsiveness_score = ?), IFNULL(responsiveness_bobot = ?)
            WHERE list_id = ? AND client_account = ? AND kategori = ? AND platform = ? AND username = ? AND date = ?
        `;
        await connection.query(updateSql, [responsiveness, responsiveness_score, responsiveness_bobot, list_id, client_account, kategori, platform, username, date]);

        console.info(`Processed responsiveness data for ${username} on ${date}`);
    } catch (error) {
        console.error(`Error processing responsiveness data for ${username} on ${date}:`, error.message);
    }
};

const processData = async () => {
    try {
        // Ambil semua tanggal unik dari tabel dailyFairScores
        const [dates] = await connection.query(`
            SELECT DISTINCT date
            FROM dailyFairScores
            ORDER BY date
        `);

        console.log(`Found ${dates.length} unique dates to process.`);

        // Loop melalui setiap tanggal
        for (const { date } of dates) {
            console.log(`Processing data for date: ${date}`);

            // Ambil semua kombinasi unik berdasarkan tanggal
            const [combinations] = await connection.query(`
                SELECT list_id, client_account, kategori, platform, date
                FROM dailyFairScores
                WHERE date = ?
            `, [date]);

            console.log(`Found ${combinations.length} combinations for date: ${date}`);

            // Loop melalui setiap kombinasi untuk memproses data
            for (const combination of combinations) {
                const { list_id, client_account, kategori, platform, username, date } = combination;

                // Panggil fungsi pemrosesan data
                await processFollowers(list_id, client_account, kategori, platform, username, date);
                await processActivities(list_id, client_account, kategori, platform, username, date);
                await processInteraction(list_id, client_account, kategori, platform, username, date);
                await processResponsiveness(list_id, client_account, kategori, platform, username, date);
            }
        }

        console.log('All data has been processed successfully.');
    } catch (error) {
        console.error("Error processing data:", error.message);
    }
};


module.exports = {
    processData,
};