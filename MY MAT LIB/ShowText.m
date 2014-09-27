function [  ] = StripeShow( im_video,direction )
    figure(1);
    subplot(1,2,1),imshow(im_video);
    title('ԭʼ��Ƶͼ');
    h = subplot(1,2,2);
    cla(h,'reset');
    axis off;
    title('�����');
    if direction == pi
        text(.5,.5,'There is not Stripe!','FontSize',14,'HorizontalAlignment','center','color','k');
    else
        text(.5,.5,{'There are stripes';['with direction horizontally ',num2str(90 - direction * 180 / pi,'%4.2f\n'),'��']},...
    'FontSize',14,'HorizontalAlignment','center','color','r');
    end
end