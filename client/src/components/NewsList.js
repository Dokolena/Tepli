import React, {useEffect, useState, useContext} from 'react';
import {Link} from 'react-router-dom';
import {observer} from 'mobx-react-lite';
import instance from '../axios/axiosController';
import EditNewsModal from './EditNewsModal';
import {AuthContext} from '../hoc/AuthProvider';

const NewsList = observer(() => {
    const [allNews, setNews] = useState([]);
    const {user} = useContext(AuthContext);

    async function getNews() {
        await instance.get('/news')
            .then((response) => setNews(response.data));
    }

    useEffect(() => {
        getNews();
    }, []);

    return (
        <React.Fragment>
            {allNews.map((news) => (
                <div key={news.newsId} className="wrapper">
                    <div className="container">
                        <div className="col-lg-12">
                            <div className="row news">
                                <h2 className="h2_header">{news.title}</h2>
                                <hr />
                                {news && news.img && news.img.map((i) => (
                                    <div className="col-lg-3 col-md-2 text-center">
                                        <img
                                            className="img-thumbnail img-responsive pull-left"
                                            src={process.env.REACT_APP_URL + i}
                                            alt="Безумный Макс"
                                        />
                                    </div>
                                ))}
                                <div className="col-lg-9 col-md-10">
                                    <p className="text-justify">{news.body}</p>
                                </div>
                                <div className="col-lg-12">
                                    <Link to={`/news/${news.newsId}`} className="btn btn-lg btn-primary pull-right">Подробнее</Link>
                                    {user.isAdmin ? (<div><EditNewsModal news={news} /></div>) : (<div />)}
                                </div>
                            </div>
                            <div className="margin-5" />
                        </div>
                    </div>
                </div>
            ))}
        </React.Fragment>
    );
});
export {NewsList};
