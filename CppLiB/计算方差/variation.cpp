#include<cv.h>
#include<cvaux.h> 
#include<highgui.h>
#include<cvcam.h>
#include<iostream.h>

#include<stdio.h>
#include<math.h>
#include<stdlib.h>

void main()
{
	unsigned char *data;//ָ��ԭͼ���ָ��
	int i,j;//ѭ������
	int height,width,step;
	double aver=0;
	double var=0;

	//����ͼ����ʾ
	IplImage *img=0;
	img=cvLoadImage("1.jpg",0);
	//����ͼ�������
	height=img->height;
	width=img->width;
	step=img->widthStep;
	data=(uchar*)img->imageData;

	for(i=0;i<height;i++)
	{
		for(j=0;j<width;j++)
		{
			aver+=data[i*step+j];			
		}
	}
   aver=aver/height/width;
	for(i=0;i<height;i++)
	{
		for(j=0;j<width;j++)
		{
			var+=pow(data[i*step+j],2);			
		}
	}
	var=var/height/width;
	var=var-(aver*aver);
	var=sqrt(var);
    cout<<var;

}