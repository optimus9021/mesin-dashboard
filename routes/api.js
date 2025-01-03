const express = require('express');
const router = express.Router();
const getDataIg = require('../controllers/getDataIg');
const getDataTiktok = require('../controllers/getDataTiktok');
const getDataNews = require('../controllers/getDataNews');
const fairControllerIg = require('../controllers/fairControllerIg');
const fairControllerTiktok = require('../controllers/fairControllerTiktok');
const db = require('../models/db'); // Pastikan ini diatur sesuai koneksi database Anda


// Endpoint untuk mengambil tanggal dari database
router.get('/getDates', async (req, res) => {
    try {
        // Query untuk mengambil data tanggal dari database
        const [rows] = await db.query('SELECT * FROM settings WHERE id = 1'); // Pastikan query sesuai dengan struktur tabel kamu
        const { startDate, endDate } = rows[0]; // Ambil tanggal yang pertama (asumsi hanya ada 1 data)
        
        // Kirim tanggal dalam format JSON ke frontend
        res.json({
            startDate: startDate,
            endDate: endDate
        });
    } catch (error) {
        console.error('Error fetching dates:', error);
        res.status(500).send('Failed to fetch dates');
    }
});

// Endpoint untuk memperbarui tanggal
router.post('/updateDates', async (req, res) => {
    const { startDate, endDate } = req.body;

    try {
        // Konversi tanggal ke format yyyy-mm-dd (untuk DATE) atau yyyy-mm-dd HH:MM:SS (untuk DATETIME)
        const formattedStartDate = new Date(startDate).toISOString().split('T')[0]; // Format DATE
        const formattedEndDate = new Date(endDate).toISOString().split('T')[0];     // Format DATE

        // Update tanggal di database
        await db.query('UPDATE settings SET startDate = ?, endDate = ? WHERE id = 1', [formattedStartDate, formattedEndDate]);
        
        res.json({ success: true });
    } catch (error) {
        console.error('Error updating dates:', error);
        res.status(500).json({ success: false, message: 'Failed to update dates' });
    }
});


// Instagram Api Methods ----------------------------------------------------------------

// Route Eksekusi server
// Eksekusi getData berdasarkan semua username di listAkun
router.get('/execute/getData', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT username FROM listAkun');
        for (const row of rows) {
            console.log(`Fetching data for user: ${row.username}...`);
            await getDataIg.getDataUser(row.username);
            console.log(`Data for user ${row.username} has been fetched and saved.`);
        }
        res.send('Data for all users have been fetched and saved.');
    } catch (error) {
        console.error('Error executing getData:', error.message);
        res.status(500).send(`Error executing getData: ${error.message}`);
    }
});

// Eksekusi getPost berdasarkan semua username di listAkun
router.get('/execute/getPost', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT username FROM listAkun');
        for (const row of rows) {
            console.log(`Fetching posts for user: ${row.username}...`);
            await getDataIg.getDataPost(row.username);
            console.log(`Posts for user ${row.username} have been fetched and saved.`);
        }
        res.send('Data for all users have been fetched and saved.');
    } catch (error) {
        console.error('Error executing getPost:', error.message);
        res.status(500).send(`Error executing getPost: ${error.message}`);
    }
});

router.get('/execute/getComment', async (req, res) => {
    const { fromStart } = req.query; // Parameter untuk menentukan apakah proses dimulai dari awal
    const processFromStart = fromStart === 'true';

    try {
        let query = 'SELECT unique_id_post FROM posts';
        
        // Jika proses tidak dimulai dari awal, hanya ambil data yang belum diproses
        if (!processFromStart) {
            query = `
                SELECT p.unique_id_post 
                FROM posts p
                LEFT JOIN mainComments mc ON p.unique_id_post = mc.unique_id_post
                WHERE mc.unique_id_post IS NULL
            `;
        }

        // Ambil data post
        const [rows] = await db.query(query);
        console.log(`Found ${rows.length} posts to process.`);

        for (const row of rows) {
            const unique_id_post = row.unique_id_post;
            console.log(`Fetching comments for post: ${unique_id_post}...`);

            // Ambil user_id dan username dari database berdasarkan unique_id_post
            const userQuery = `
                SELECT user_id, username, comments 
                FROM posts 
                WHERE unique_id_post = ?
            `;
            const [userRows] = await db.query(userQuery, [unique_id_post]);

            if (userRows.length === 0) {
                console.log(`Post ${unique_id_post} not found in database.`);
                continue; // Lanjutkan ke post berikutnya jika tidak ditemukan
            }

            const { user_id, username, comments } = userRows[0];

            // Proses komentar jika jumlah komentar lebih dari 0
            if (comments > 0) {
                try {
                    await getDataIg.getDataComment(unique_id_post, user_id, username);
                    console.log(`Comments for post ${unique_id_post} have been fetched and saved.`);
                } catch (err) {
                    console.error(`Error fetching comments for post ${unique_id_post}:`, err.message);                
                }
            } else {
                console.log(`No comments for post ${unique_id_post}.`);
            }
        }
        res.send('Data for all users have been fetched and saved.');
    } catch (error) {
        console.error('Error executing getComment:', error.message);
        res.status(500).json({ message: 'Terjadi kesalahan saat menjalankan proses getComment.', error: error.message });
    }
});

router.get('/execute/getChildComment', async (req, res) => {
    const { fromStart } = req.query; // Parameter untuk menentukan apakah proses dimulai dari awal
    const processFromStart = fromStart === 'true';

    try {
        let queryChild = 'SELECT comment_unique_id FROM mainComments';
        
        // Jika proses tidak dimulai dari awal, hanya ambil data yang belum diproses
        if (!processFromStart) {
            queryChild = `
                SELECT p.comment_unique_id 
                FROM mainComments p
                LEFT JOIN childComments mc ON p.comment_unique_id = mc.comment_unique_id
                WHERE mc.comment_unique_id IS NULL
            `;
        }

        // Ambil komentar anak
        const [childs] = await db.query(queryChild);
        console.log(`Found ${childs.length} child comments to process.`);

        for (const child of childs) {
            const comment_unique_id = child.comment_unique_id;
            console.log(`Fetching child comments for comment: ${comment_unique_id}...`);

            // Ambil user_id, username, unique_id_post, dan child_comment_count dari database
            const userQuery = `
                SELECT user_id, username, unique_id_post, child_comment_count 
                FROM mainComments 
                WHERE comment_unique_id = ?
            `;
            const [userChild] = await db.query(userQuery, [comment_unique_id]);

            if (userChild.length === 0) {
                console.log(`Comment ${comment_unique_id} not found in database.`);
                continue;
            }

            const { user_id, username, unique_id_post, child_comment_count } = userChild[0];

            // Proses komentar anak jika jumlah komentar lebih dari 0
            if (child_comment_count > 0) {
                try {
                    await getDataIg.getDataChildComment(user_id, username, unique_id_post, comment_unique_id);
                    console.log(`Child comments for comment ${comment_unique_id} have been fetched and saved.`);
                } catch (err) {
                    console.error(`Error fetching child comments for comment ${comment_unique_id}:`, err.message);
                }
            } else {
                console.log(`No child comments to fetch for comment ${comment_unique_id}.`);
            }
        }
        res.send('Data for all users have been fetched and saved.');
    } catch (error) {
        console.error('Error executing getChildComment:', error.message);
        res.status(500).json({ message: 'Terjadi kesalahan saat menjalankan proses getChildComment.', error: error.message });
    }
});

// Eksekusi getLikes count
router.get('/execute/getLikes', async (req, res) => {
    try {
        let query = 'SELECT post_code FROM posts';

        const [rows] = await db.query(query);

        for (const row of rows) {
            const post_code = row.post_code;
            const userQuery = `
                SELECT created_at
                FROM posts
                WHERE post_code = ?
            `;
            const [userRows] = await db.query(userQuery, [post_code]);
            const {created_at} = userRows[0];
            try {
                console.log(`Fetching likes for post: ${post_code}...`);
                await getDataIg.getDataLikes(post_code, created_at);
                console.log(`Likes for post ${post_code} have been fetched and saved.`);
            } catch (err) {
                console.error(`Error fetching likes for post ${post_code}:`, err.message);
            }
        }
        res.send('Data for all users have been fetched and saved.');
    } catch (error) {
        console.error('Error executing getLikes:', error.message);
        res.status(500).send(`Error executing getLikes: ${error.message}`);
    }
});

router.get('/data/followersIg', fairControllerIg.getFollowersIg);
router.get('/data/activitiesIg', fairControllerIg.getActivitiesIg);
router.get('/data/interactionIg', fairControllerIg.getInteractionIg);
router.get('/data/responsivenessIg', fairControllerIg.getResponsivenessIg);
router.get('/data/likesUserIg', fairControllerIg.getLikesUserIg);
router.get('/data/allPostsIg', fairControllerIg.getAllDataPostIg);

// TikTok Api Methods ----------------------------------------------------------------

// Route Eksekusi server
// Eksekusi getData berdasarkan semua username di listAkun
router.get('/execute/getData', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT username FROM listAkun');
        for (const row of rows) {
            console.log(`Fetching data for user: ${row.username}...`);
            await getDataTiktok.getDataUser(row.username);
            console.log(`Data for user ${row.username} has been fetched and saved.`);
        }
        res.send('Data for all users have been fetched and saved.');
    } catch (error) {
        console.error('Error executing getData:', error.message);
        res.status(500).send(`Error executing getData: ${error.message}`);
    }
});

// Eksekusi getPost berdasarkan semua username di listAkun
router.get('/execute/getPost', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT username FROM listAkun');
        for (const row of rows) {
            console.log(`Fetching posts for user: ${row.username}...`);
            await getDataTiktok.getDataPost(row.username);
            console.log(`Posts for user ${row.username} have been fetched and saved.`);
        }
        res.send('Data for all users have been fetched and saved.');
    } catch (error) {
        console.error('Error executing getPost:', error.message);
        res.status(500).send(`Error executing getPost: ${error.message}`);
    }
});

router.get('/execute/getComment', async (req, res) => {
    const { fromStart } = req.query; // Parameter untuk menentukan apakah proses dimulai dari awal
    const processFromStart = fromStart === 'true';

    try {
        let query = 'SELECT unique_id_post FROM posts';
        
        // Jika proses tidak dimulai dari awal, hanya ambil data yang belum diproses
        if (!processFromStart) {
            query = `
                SELECT p.unique_id_post 
                FROM posts p
                LEFT JOIN mainComments mc ON p.unique_id_post = mc.unique_id_post
                WHERE mc.unique_id_post IS NULL
            `;
        }

        // Ambil data post
        const [rows] = await db.query(query);
        console.log(`Found ${rows.length} posts to process.`);

        for (const row of rows) {
            const unique_id_post = row.unique_id_post;
            console.log(`Fetching comments for post: ${unique_id_post}...`);

            // Ambil user_id dan username dari database berdasarkan unique_id_post
            const userQuery = `
                SELECT user_id, username, comments 
                FROM posts 
                WHERE unique_id_post = ?
            `;
            const [userRows] = await db.query(userQuery, [unique_id_post]);

            if (userRows.length === 0) {
                console.log(`Post ${unique_id_post} not found in database.`);
                continue; // Lanjutkan ke post berikutnya jika tidak ditemukan
            }

            const { user_id, username, comments } = userRows[0];

            // Proses komentar jika jumlah komentar lebih dari 0
            if (comments > 0) {
                try {
                    await getDataTiktok.getDataComment(unique_id_post, user_id, username);
                    console.log(`Comments for post ${unique_id_post} have been fetched and saved.`);
                } catch (err) {
                    console.error(`Error fetching comments for post ${unique_id_post}:`, err.message);                
                }
            } else {
                console.log(`No comments for post ${unique_id_post}.`);
            }
        }
        res.send('Data for all users have been fetched and saved.');
    } catch (error) {
        console.error('Error executing getComment:', error.message);
        res.status(500).json({ message: 'Terjadi kesalahan saat menjalankan proses getComment.', error: error.message });
    }
});

router.get('/execute/getChildComment', async (req, res) => {
    const { fromStart } = req.query; // Parameter untuk menentukan apakah proses dimulai dari awal
    const processFromStart = fromStart === 'true';

    try {
        let queryChild = 'SELECT comment_unique_id FROM mainComments';
        
        // Jika proses tidak dimulai dari awal, hanya ambil data yang belum diproses
        if (!processFromStart) {
            queryChild = `
                SELECT p.comment_unique_id 
                FROM mainComments p
                LEFT JOIN childComments mc ON p.comment_unique_id = mc.comment_unique_id
                WHERE mc.comment_unique_id IS NULL
            `;
        }

        // Ambil komentar anak
        const [childs] = await db.query(queryChild);
        console.log(`Found ${childs.length} child comments to process.`);

        for (const child of childs) {
            const comment_unique_id = child.comment_unique_id;
            console.log(`Fetching child comments for comment: ${comment_unique_id}...`);

            // Ambil user_id, username, unique_id_post, dan child_comment_count dari database
            const userQuery = `
                SELECT user_id, username, unique_id_post, child_comment_count 
                FROM mainComments 
                WHERE comment_unique_id = ?
            `;
            const [userChild] = await db.query(userQuery, [comment_unique_id]);

            if (userChild.length === 0) {
                console.log(`Comment ${comment_unique_id} not found in database.`);
                continue;
            }

            const { user_id, username, unique_id_post, child_comment_count } = userChild[0];

            // Proses komentar anak jika jumlah komentar lebih dari 0
            if (child_comment_count > 0) {
                try {
                    await getDataTiktok.getDataChildComment(user_id, username, unique_id_post, comment_unique_id);
                    console.log(`Child comments for comment ${comment_unique_id} have been fetched and saved.`);
                } catch (err) {
                    console.error(`Error fetching child comments for comment ${comment_unique_id}:`, err.message);
                }
            } else {
                console.log(`No child comments to fetch for comment ${comment_unique_id}.`);
            }
        }
        res.send('Data for all users have been fetched and saved.');
    } catch (error) {
        console.error('Error executing getChildComment:', error.message);
        res.status(500).json({ message: 'Terjadi kesalahan saat menjalankan proses getChildComment.', error: error.message });
    }
});

// Eksekusi getLikes count
router.get('/execute/getLikes', async (req, res) => {
    try {
        let query = 'SELECT post_code FROM posts';

        const [rows] = await db.query(query);

        for (const row of rows) {
            const post_code = row.post_code;
            const userQuery = `
                SELECT created_at
                FROM posts
                WHERE post_code = ?
            `;
            const [userRows] = await db.query(userQuery, [post_code]);
            const {created_at} = userRows[0];
            try {
                console.log(`Fetching likes for post: ${post_code}...`);
                await getDataTiktok.getDataLikes(post_code, created_at);
                console.log(`Likes for post ${post_code} have been fetched and saved.`);
            } catch (err) {
                console.error(`Error fetching likes for post ${post_code}:`, err.message);
            }
        }
        res.send('Data for all users have been fetched and saved.');
    } catch (error) {
        console.error('Error executing getLikes:', error.message);
        res.status(500).send(`Error executing getLikes: ${error.message}`);
    }
});

router.get('/data/followersTiktok', fairControllerTiktok.getFollowersTiktok);
router.get('/data/activitiesTiktok', fairControllerTiktok.getActivitiesTiktok);
router.get('/data/interactionTiktok', fairControllerTiktok.getInteractionTiktok);
router.get('/data/responsivenessTiktok', fairControllerTiktok.getResponsivenessTiktok);
router.get('/data/likesUserTiktok', fairControllerTiktok.getLikesUserTiktok);
router.get('/data/allPostsTiktok', fairControllerTiktok.getAllDataPostTiktok);

// News Api Methods ----------------------------------------------------------------

router.get('/execute/getNews', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT query FROM listNews');
        for (const row of rows) {
            console.log(`Fetching data for query: ${row.query}...`);
            await getDataNews.getDataNews(row.query);
            console.log(`Data for News ${row.query} has been fetched and saved.`);
        }
        res.send('Data for all users have been fetched and saved.');
    } catch (error) {
        console.error('Error executing getDataNews:', error.message);
        res.status(500).send(`Error executing getDataNews: ${error.message}`);
    }
});

module.exports = router;

