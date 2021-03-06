#ifndef UPDATE_MANAGER_H
#define UPDATE_MANAGER_H
#include <QObject>
#include <QDate>
#include <QTimer>
#include <QFuture>
#include <QVector>
#include <QFutureWatcher>
#include "core/download_manager.h"

class QJsonObject;
class ExtensionBar;
class QApplication;
class UpdateManager : public DownloadManager
{
    Q_OBJECT
    
    struct UpdatedFile {
        QString localFile;
        QString remoteFilename;
    };
    
    static const qint64 kDaysToCheck = 1;
    static const qint64 kCheckIntervalInMs = 7200000; // Every 3 hours
    static const char* kServerUrlBase;
    static const char* kVersionInfoFilename;
    static const char* kRemoteFilesSuffix;
    static const char* kLocalFilesSuffix;
public:
    explicit UpdateManager(QObject* parent = 0);
    virtual ~UpdateManager();
    void initialize(ExtensionBar* extensionBar);
    bool updateFiles();
    void saveDownloadedFilesListToFile() const;
    bool performedUpdate() const;
    
private slots:
    void performAsyncUpdate();
    void downloadProgressUpdated(qint64, qint64);
private:
    QDate m_lastChecked;
    QTimer m_updateTimer;
    QFuture<void> m_future;
    QFutureWatcher<void> m_futureWatcher;
    QApplication* m_app;
    ExtensionBar* m_extensionBar;
    QVector<QString> m_downloadedFiles;
    bool m_performedUpdate;
    
    bool needToCheckForUpdates() const;
    QString versionInfoUrl() const;
    
    bool update();
    bool updatePlatform(QJsonObject* jsonObject);
    bool updateExtensions(QJsonObject* jsonObject);
    bool updateDatabase(QJsonObject* jsonObject);
};

#endif // UPDATE_MANAGER_H
