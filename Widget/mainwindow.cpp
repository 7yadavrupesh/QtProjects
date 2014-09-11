#include "mainwindow.h"
#include "ui_mainwindow.h"


MainWindow::MainWindow(QWidget *parent) :    QMainWindow(parent),    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    QString HttpAddress = ui->addressBar->text();
    ui->textEdit->append("<b>Button Clicked!!</b>");
    QUrl url(HttpAddress);
    request.setUrl(url);
    reply = manager.get(request);
    connect(reply, SIGNAL(readyRead()), this, SLOT(slotReadyRead()));
}
void MainWindow::slotReadyRead(){
    file = new QFile("DownloadedData.txt");
    file->open(0,QIODevice::ReadWrite);
    file->write(reply->readAll());
    QByteArray bArray = reply->readAll();
    QString tempString = bArray.data();
    ui->textEdit->append(tempString);
}
