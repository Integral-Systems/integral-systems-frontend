// import directTransport from 'nodemailer-direct-transport';
import nodemailer from 'nodemailer';
import hbs from 'nodemailer-express-handlebars';
// import path from 'path'; INFO: We need a better way to find the template files!

const username = process.env.USMTP;
const password = process.env.PSMTP;
const mailTo = process.env.EMAIL || 'gradlon@integral-systems.ch';
const smtpServer = process.env.SMTPS || 'smtp.gmail.com';
const mailPort = process.env.SMTPP || 587;

export default async function (req) {

  // let message = req.body.message
  // message = message.replace(new RegExp('\r?\n','g'), '<br />');

    let transporter = nodemailer.createTransport({
        host: smtpServer,
        port: mailPort,
        secure: false, // upgrade later with STARTTLS
        auth: {
            user: username,
            pass: password
        }
    });
    //Templating Settings
    let options = {
        viewEngine: {
            extname: '.hbs',
            layoutsDir: './src/lib/server/views/email/',
            defaultLayout : 'template',
            partialsDir : './src/lib/server/views/email/partials'
        },
        viewPath: './src/lib/server/views/email/',
        extName: '.hbs'
    };
      //mailOptions
    let mailOptions = {
        from: username,
        to: mailTo,
        replyTo: req.body.email,
        subject: req.body.first_name + req.body.last_name + ' via hirefit - Getstarted',
        template: 'email_body',
        context: {...req.body}
    };
    transporter.use('compile', hbs(options));
    return await transporter.sendMail(mailOptions);
}
