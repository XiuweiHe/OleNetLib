/**
* �����ͼƬ����Щ�ط���
* �����������ͺ�
* ���磺����ͼƬ��Χ50�����أ�����ȡͼƬ�м�����
* cut_frame(pImgOld1, pImgOld2, cvRect(BORDER, BORDER, pImgOld1->width-BORDER*2, pImgOld1->height-BORDER*2));
*/
static void cut_frame(IplImage* img,IplImage* dst, CvRect rcet)
{
	IplImage* src=img;
	int width = src->width;
	int height = src->height;
	cvSetImageROI(src, rcet);
	cvCopy(src,dst,0);
	cvResetImageROI(src);
}