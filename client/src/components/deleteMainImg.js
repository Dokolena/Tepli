import React from 'react';
import {Button} from 'react-bootstrap';
import instance from '../axios/axiosController';

const DeleteImg = ({image}) => {
    const delImg = async (e) => {
        e.preventDefault();
        try {
            await instance.delete(`/${image.imageId}`);
        } catch (err) {
            console.error(err.message);
        }
    };
    return (
        <div>
            <Button
                type="button"
                className="btn btn-info btn-lg pull-right"
                onClick={(e) => delImg(e)}
            >&times;
            </Button></div>
    );
};
export default DeleteImg;
