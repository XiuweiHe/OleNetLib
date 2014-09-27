
/*
* ��rgb����ͨ��ƴ��һ��ͼƬ
* Ҳ��I3�Ŀ��ΪpImg�Ŀ�ȵ�3��
*
*
*/
static void rgbExpand(IplImage* pImg,IplImage* I3)
{
	
	int height = pImg->height;
	int width = pImg->width;
	CvSize SrcSize = cvSize(width, height);
	IplImage *B   = cvCreateImage(SrcSize, IPL_DEPTH_8U, 1);
	IplImage *G   = cvCreateImage(SrcSize, IPL_DEPTH_8U, 1);
	IplImage *R   = cvCreateImage(SrcSize, IPL_DEPTH_8U, 1);
	cvSplit(pImg,B,G,R,0);
	cvSetImageROI(I3, cvRect((B->width) *0, 0, width, height));
    cvCopy(B, I3, 0);
	cvResetImageROI(I3);
	cvSetImageROI(I3, cvRect((B->width) *1, 0, width, height));
    cvCopy(G, I3, 0);
	cvResetImageROI(I3);
	cvSetImageROI(I3, cvRect((B->width) *2, 0, width, height));
    cvCopy(R, I3, 0);
	cvResetImageROI(I3);
	
	cvReleaseImage(&R);
	cvReleaseImage(&G);
	cvReleaseImage(&B);
}