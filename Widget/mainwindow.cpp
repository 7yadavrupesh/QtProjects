#include "mainwindow.h"
#include "ui_mainwindow.h"


MainWindow::MainWindow(QWidget *parent) :    QMainWindow(parent),    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->addressBar->setText("http://textfiles.com/100/914bbs.txt");
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
    connect(reply, SIGNAL(readyRead()), SLOT(slotReadyRead()));
}
void MainWindow::slotReadyRead(){
    QByteArray bArray = reply->readAll();
    QString tempString = bArray.data();
    ui->textEdit->append(tempString);
    ui->textEdit->append(reply->url().fileName());
    file = new QFile();
    file->setFileName(reply->url().fileName());
    file->open(QIODevice::WriteOnly);
    file->write(reply->readAll());
    file->close();
}
