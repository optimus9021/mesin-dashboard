const db = require('../models/db'); // Database connection
require('dotenv').config(); // Load environment variables from .env file

// Fungsi untuk mendapatkan data followers
async function getFollowersIg(req, res) {
    try {
        const [rows] = await db.query(`
            SELECT 
                la.kategori, 
                u.username, 
                u.followers
            FROM listAkun la
            JOIN users u ON la.username = u.username
        `);
        res.json(rows);
    } catch (error) {
        console.error("Error fetching followers data:", error);
        res.status(500).send("Failed to fetch followers data");
    }
}

// Fungsi untuk mendapatkan data activities
async function getActivitiesIg(req, res) {

    // Ambil startDate dari server
    const response = await fetch(`http://localhost:${process.env.PORT}/api/getDates`);
    const data = await response.json();
    
    // Menetapkan tanggal secara statis
    const start_date = new Date(data.startDate).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });
    const end_date = new Date(data.endDate).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });

    try {
        const [rows] = await db.query(`
            SELECT 
                la.kategori, 
                u.username, 
                (COUNT(p.post_id) / DATEDIFF(?, ?)) AS activities
            FROM listAkun la
            JOIN users u ON la.username = u.username
            LEFT JOIN posts p ON p.username = u.username AND p.created_at BETWEEN ? AND ?
            GROUP BY u.username
        `, [end_date, start_date, start_date, end_date]); // Pass tanggal yang telah ditentukan

        res.json(rows);
    } catch (error) {
        console.error("Error fetching activities data:", error);
        res.status(500).send("Failed to fetch activities data");
    }
}

// Fungsi untuk mendapatkan data interaction
async function getInteractionIg(req, res) {
    
    // Ambil startDate dari server
    const response = await fetch(`http://localhost:${process.env.PORT}/api/getDates`);
    const data = await response.json();
    
    // Menetapkan tanggal secara statis // Coba Check Lagi Rumus Nya
    const start_date = new Date(data.startDate).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });
    const end_date = new Date(data.endDate).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });

    try {
        const [rows] = await db.query(`
            SELECT 
                la.kategori, 
                u.username, 
                AVG(p.likes) AS interaction
            FROM listAkun la
            JOIN users u ON la.username = u.username
            LEFT JOIN posts p ON p.username = u.username
            WHERE p.created_at BETWEEN ? AND ?  -- Gunakan tanggal yang telah ditentukan
            GROUP BY u.username
        `, [start_date, end_date]); // Pass tanggal yang telah ditentukan
        res.json(rows);
    } catch (error) {
        console.error("Error fetching interaction data:", error);
        res.status(500).send("Failed to fetch interaction data");
    }
}

// Fungsi untuk mendapatkan data responsiveness
async function getResponsivenessIg(req, res) {

    // Ambil startDate dari server
    const response = await fetch(`http://localhost:${process.env.PORT}/api/getDates`);
    const data = await response.json();
    
    // Menetapkan tanggal secara statis
    const start_date = new Date(data.startDate).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });
    const end_date = new Date(data.endDate).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });

    try {
        const [rows] = await db.query(`
            SELECT 
                la.kategori,
                u.username,
                COALESCE(SUM(
                    (SELECT COUNT(*) FROM mainComments mc WHERE mc.unique_id_post = p.unique_id_post) +
                    (SELECT COUNT(*) FROM childComments cc WHERE cc.unique_id_post = p.unique_id_post)
                ), 0) AS total_comments, -- Menghitung total komentar per username
                COALESCE(SUM(
                    (SELECT COUNT(*) FROM mainComments mc WHERE mc.commenter_username = u.username AND mc.unique_id_post = p.unique_id_post) +
                    (SELECT COUNT(*) FROM childComments cc WHERE cc.child_commenter_username = u.username AND cc.unique_id_post = p.unique_id_post)
                ), 0) AS total_comments_by_username -- Menghitung total komentar yang dibuat oleh username
            FROM listAkun la
            JOIN users u ON la.username = u.username
            LEFT JOIN posts p ON p.username = u.username
            WHERE p.created_at BETWEEN ? AND ?  -- Gunakan tanggal yang telah ditentukan
            GROUP BY u.username
        `, [start_date, end_date]); // Pass tanggal yang telah ditentukan

        res.json(rows); // Mengirim hasil ke frontend
    } catch (error) {
        console.error("Error fetching responsiveness data:", error);
        res.status(500).send("Failed to fetch responsiveness data");
    }
}

// Fungsi untuk mendapatkan data likes user
async function getLikesUserIg(req, res) {

    // Ambil startDate dari server
    const response = await fetch(`http://localhost:${process.env.PORT}/api/getDates`);
    const data = await response.json();
    
    // Menetapkan tanggal secara statis
    const start_date = new Date(data.startDate).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });
    const end_date = new Date(data.endDate).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });

    try {
        const [rows] = await db.query(`
            SELECT 
                u.username, 
                COUNT(DISTINCT l.post_code) AS total_likes
            FROM likes u
            LEFT JOIN likes l ON l.username = u.username
            WHERE l.created_at BETWEEN ? AND ?  -- Gunakan tanggal yang telah ditentukan
            GROUP BY u.username
            ORDER BY total_likes DESC
        `, [start_date, end_date]);
        res.json(rows);
    } catch (error) {
        console.error("Error fetching likes data:", error);
        res.status(500).send("Failed to fetch likes data");
    }
}

// Fungsi untuk mendapatkan semua data postingan
async function getAllDataPostIg(req, res) {
    const response = await fetch(`http://localhost:${process.env.PORT}/api/getDates`);
    const data = await response.json();
    
    // Menetapkan tanggal secara statis
    const start_date = new Date(data.startDate).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });
    const end_date = new Date(data.endDate).toLocaleDateString('en-CA', { timeZone: 'Asia/Jakarta' });

    try {
        const [rows] = await db.query(`
            SELECT * FROM posts WHERE created_at BETWEEN ? AND ?
        `, [start_date, end_date]);
        res.json(rows);
    } catch (error) {
        console.error("Error fetching posts data:", error);
        res.status(500).send("Failed to fetch posts data");
    }
}


module.exports = { getFollowersIg, getActivitiesIg, getInteractionIg, getResponsivenessIg, getLikesUserIg, getAllDataPostIg};
