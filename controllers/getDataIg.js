require('dotenv').config(); // Load environment variables from .env file
const axios = require('axios');
const save = require('./saveDataIg');

// Fungsi helper untuk melakukan permintaan API dengan retry
const apiRequestWithRetry = async (config, maxRetries = 5) => {
    let attempts = 0;
    while (attempts < maxRetries) {
        try {
            const response = await axios.request(config);
            return response; // Jika berhasil, langsung return response
        } catch (error) {
            attempts++;
            console.error(`Error fetching data (Attempt ${attempts} of ${maxRetries}):`, error.message);
            if (attempts === maxRetries) throw new Error('Max retries reached. Stopping.');
        }
    }
};

// Fungsi untuk mendapatkan data User dari API
const getDataUser = async (username = null) => {
    try {
        const getUser = {
            method: 'GET',
            url: 'https://instagram-scraper-api2.p.rapidapi.com/v1/info',
            params: {
                username_or_id_or_url: username
            },
            headers: {
                'X-RapidAPI-Key': process.env.RAPIDAPI_IG_KEY,
                'X-RapidAPI-Host': process.env.RAPIDAPI_IG_HOST
            }
        };

        const response = await apiRequestWithRetry(getUser);

        if (!response.data || !response.data.data) {
            throw new Error('Response does not contain user data');
        }

        const userData = response.data.data;

        const user = {
            username: userData.username,
            user_id: userData.id,
            followers: userData.follower_count || 0,
            following: userData.following_count || 0,
            mediaCount: userData.media_count || 0
        };

        await save.saveUser(user);
    } catch (error) {
        console.error(`Error fetching data for user ${username}:`, error.message);
    }
};

// Fungsi untuk mendapatkan data Post dari API
const getDataPost = async (username = null) => {
    try {

        // Ambil startDate dari server
        const response = await fetch(`http://localhost:${process.env.PORT}/api/getDates`);
        const data = await response.json();
        
        const endDate = new Date(data.startDate).toISOString().split('T')[0];
        
        let paginationToken = null;
        let morePosts = true;
        const endDateObj = new Date(endDate).getTime();

        while (morePosts) {
            const getPost = {
                method: 'GET',
                url: 'https://instagram-scraper-api2.p.rapidapi.com/v1.2/posts',
                params: {
                    username_or_id_or_url: username,
                    ...(paginationToken && { pagination_token: paginationToken })
                },
                headers: {
                    'X-RapidAPI-Key': process.env.RAPIDAPI_IG_KEY,
                    'X-RapidAPI-Host': process.env.RAPIDAPI_IG_HOST
                }
            };

            const response = await apiRequestWithRetry(getPost);

            if (!response.data || !response.data.data) {
                throw new Error('Response does not contain user data');
            }

            const userPosts = response.data.data.items;
            const userName = response.data.data.user;

            for (const item of userPosts) {
                const isPinned = item.is_pinned ? 1 : 0;
                const postDate = new Date(item.taken_at * 1000).getTime();

                if (isPinned) {
                    const post = {
                        user_id: userName.id,
                        unique_id_post: item.id,
                        username: userName.username,
                        created_at: new Date(postDate).toISOString().slice(0, 19).replace('T', ' '),
                        thumbnail_url: item.thumbnail_url,
                        caption: item.caption?.text || '',
                        post_code: item.code,
                        comments: item.comment_count,
                        likes: item.like_count,
                        media_name: item.media_name,
                        product_type: item.product_type,
                        tagged_users: item.tagged_users?.map(tag => tag.user.username).join(', ') || '',
                        is_pinned: isPinned
                    };

                    await save.savePost(post);
                    continue;
                }

                if (postDate < endDateObj) {
                    return;
                }

                const post = {
                    user_id: userName.id,
                    unique_id_post: item.id,
                    username: userName.username,
                    created_at: new Date(postDate).toISOString().slice(0, 19).replace('T', ' '),
                    thumbnail_url: item.thumbnail_url,
                    caption: item.caption?.text || '',
                    post_code: item.code,
                    comments: item.comment_count,
                    likes: item.like_count,
                    media_name: item.media_name,
                    product_type: item.product_type,
                    tagged_users: item.tagged_users?.map(tag => tag.user.username).join(', ') || '',
                    is_pinned: isPinned
                };

                await save.savePost(post);
            }

            paginationToken = response.data.pagination_token;
            if (!paginationToken) morePosts = false;
        }
    } catch (error) {
        console.error(`Error fetching data for user ${username}:`, error.message);
    }
};

// Fungsi untuk mendapatkan data Comment dari API
const getDataComment = async (unique_id_post = null, user_id = null, username = null) => {
    try {
        let paginationToken = null;
        let moreComments = true;

        while (moreComments) {
            const getComment = {
                method: 'GET',
                url: 'https://instagram-scraper-api2.p.rapidapi.com/v1/comments',
                params: {
                    code_or_id_or_url: unique_id_post,
                    ...(paginationToken && { pagination_token: paginationToken })
                },
                headers: {
                    'X-RapidAPI-Key': process.env.RAPIDAPI_IG_KEY,
                    'X-RapidAPI-Host': process.env.RAPIDAPI_IG_HOST
                }
            };

            const response = await apiRequestWithRetry(getComment);

            if (!response.data || !response.data.data || !response.data.data.items) {
                moreComments = false;
                break;
            }

            const userComment = response.data.data.items;

            for (const item of userComment) {
                const comment = {
                    user_id: user_id,
                    username: username,
                    unique_id_post: unique_id_post,
                    comment_unique_id: item.id,
                    created_at: new Date(item.created_at * 1000).toISOString().slice(0, 19).replace('T', ' '),
                    commenter_username: item.user.username,
                    commenter_userid: item.user.id,
                    comment_text: item.text,
                    comment_like_count: item.comment_like_count,
                };

                await save.saveComment(comment);
            }

            paginationToken = response.data.pagination_token;
            if (!paginationToken) moreComments = false;
        }
    } catch (error) {
        console.error(`Error fetching data for ${unique_id_post}:`, error.message);
    }
};

// Fungsi untuk mendapatkan data Child Comment dari API
const getDataChildComment = async (unique_id_post = null) => {
    try {
        let paginationToken = null;
        let moreComments = true;

        while (moreComments) {
            const getComment = {
                method: 'GET',
                url: 'https://instagram-scraper-api2.p.rapidapi.com/v1/comments',
                params: {
                    code_or_id_or_url: unique_id_post,
                    ...(paginationToken && { pagination_token: paginationToken })
                },
                headers: {
                    'X-RapidAPI-Key': process.env.RAPIDAPI_IG_KEY,
                    'X-RapidAPI-Host': process.env.RAPIDAPI_IG_HOST
                }
            };

            const response = await apiRequestWithRetry(getComment);

            if (!response.data || !response.data.data || !response.data.data.items) {
                moreComments = false;
                break;
            }

            const userComment = response.data.comments;

            for (const item of userComment) {
                const childComment = {
                    user_id: item.user_id,
                    username: item.user.username,
                    unique_id_post: unique_id_post,
                    comment_unique_id: item.pk,
                    created_at: new Date(item.created_at * 1000).toISOString().slice(0, 19).replace('T', ' '),
                    commenter_username: item.user.username,
                    commenter_userid: item.user.id,
                    comment_text: item.text,
                    comment_like_count: item.comment_like_count,
                    child_comment_count: item.child_comment_count,
                };

                await save.saveChildComment(childComment);
            }

            paginationToken = response.data.pagination_token;
            if (!paginationToken) moreComments = false;
        }
    } catch (error) {
        console.error(`Error fetching data for ${unique_id_post}:`, error.message);
    }
};

// Fungsi untuk mendapatkan data Post dari API
const getDataLikes = async (post_code = null, created_at = null) => {
    try {
        const getLikes = {
            method: 'GET',
            url: 'https://instagram-scraper-api2.p.rapidapi.com/v1/likes',
            params: {
                code_or_id_or_url: post_code,
            },
            headers: {
                'X-RapidAPI-Key': process.env.RAPIDAPI_IG_KEY,
                'X-RapidAPI-Host': process.env.RAPIDAPI_IG_HOST
            }
        };

        const response = await apiRequestWithRetry(getLikes);

        if (!response.data || !response.data.data) {
            throw new Error('Response does not contain user data');
        }

        const userLikes = response.data.data.items;

        for (const item of userLikes) {

            const likes = {
                post_code: post_code,
                user_id: item.id,
                username: item.username,
                fullname: item.full_name,
                created_at : new Date(created_at).toISOString().slice(0, 19).replace('T', ' '),

            };

            await save.saveLikes(likes);
        }
    } catch (error) {
        console.error(`Error fetching data for user ${username}:`, error.message);
    }
};

module.exports = {
    getDataUser,
    getDataPost,
    getDataComment,
    getDataChildComment,
    getDataLikes
};
