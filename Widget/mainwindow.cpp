#include "mainwindow.h"
#include "ui_mainwindow.h"


MainWindow::MainWindow(QWidget *parent) :    QMainWindow(parent),    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->addressBar->setText("http://eofdreams.com/data_images/dreams/eclipse/eclipse-04.jpg");
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    ui->pushButton->setEnabled(false);
    QString HttpAddress = ui->addressBar->text();
    ui->textBrowser->append("<b>Button Clicked!!</b>");
    QUrl url(HttpAddress);
    request.setUrl(url);
    reply = manager.get(request);
    //connect(reply, SIGNAL(readyRead()), SLOT(slotReadyRead()));
    connect(reply, SIGNAL(finished()), SLOT(downloadFinished()));
}

void MainWindow::slotReadyRead(){

    file = new QFile(reply->url().fileName());
    if(file->open(QIODevice::WriteOnly)){
        file->write(reply->readAll());
    }else
        cout << "Unable to open file";
}

void MainWindow::downloadFinished(){

    QByteArray jpegData = reply->readAll();
        QPixmap pixmap;
        pixmap.loadFromData(jpegData);
    ui->pushButton->setEnabled(true);
    //ui->textBrowser();
    QMessageBox msg;
    msg.setWindowTitle(" ");
    msg.setStandardButtons(QMessageBox::Ok);
    msg.setText(file->fileName()+" Downloaded");
    msg.exec();
}
