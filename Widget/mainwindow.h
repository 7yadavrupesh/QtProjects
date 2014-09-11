#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QtNetwork/qnetworkaccessmanager.h>
#include <QtNetwork/qnetworkrequest.h>
#include <QtNetwork/qnetworkreply.h>
#include <QFile>
#include <iostream>
#include <stdlib.h>

using namespace std;

namespace Ui {
class MainWindow;
}

class MainWindow :public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_pushButton_clicked();
    void slotReadyRead();
private:
    Ui::MainWindow *ui;
    QNetworkAccessManager manager;
    QNetworkReply *reply;
    QNetworkRequest request;
    QFile *file;
};

#endif // MAINWINDOW_H
