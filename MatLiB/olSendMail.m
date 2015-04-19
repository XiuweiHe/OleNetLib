function olSendMail(accountFrom, accountTo, pwd, subject, content)
% THE PARAM SHOULD BE LIKE THIS:
%   ACCOUNTFROM = 'YOURMAIL@HERE.COM';
%   ACCOUNTTO = 'YOURMAIL@HERE.COM';
%   PWD = 'YOURPASSWORD';
%   SUBJECT = 'HELLO WORLD!';
%   CONTENT = 'HELLO WORLD FROM 511';

if nargin < 1
    accountFrom = 'wust_imvl505@126.com';
    accountTo = '17789917@qq.com';
    pwd = 'imvl505';
    subject = 'hello world!';
    content = 'hello world from 505';
end

mail = accountFrom;
password = pwd;

setpref('Internet','E_mail',mail);
setpref('Internet','SMTP_Server','smtp.126.com');
setpref('Internet','SMTP_Username',mail);
setpref('Internet','SMTP_Password',password);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

sendmail(accountTo, subject, content);

fprintf('E-mail was sent successfully!\n');