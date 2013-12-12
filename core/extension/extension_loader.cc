#include "core/extension/extension_loader.h"

#include <QPluginLoader>
#include <QFileDialog>
#include <QAction>
#include <QMenuBar>

#include "core/logging/logging.h"
#include "core/extension/extension_base.h"
#include "core/extension/abstract_extension.h"
#include "core/extension/extension_bar.h"
#include "core/data/data_holder.h"

ExtensionLoader::ExtensionLoader(data::DataHolder* dataHolder, SettingsLoader* settingsLoader, QMenuBar* menuBar) :
    m_dataHolder(dataHolder),
    m_settingsLoader(settingsLoader),
    m_menuBar(menuBar)
{
}

void ExtensionLoader::loadAll(const QString& appPath, ExtensionBar* extensionBar) const
{
    _TRACE;
    LOG(INFO) << "Loading all the extensions. ExtensionBar [" << extensionBar << "]; application path: "
                << appPath;
    
    QDir extensionsDir(appPath + "/extensions/", "*.so", QDir::Name | QDir::IgnoreCase, QDir::Files);
    
    for (QString extensionFilename : extensionsDir.entryList()) {
        QPluginLoader loader(extensionsDir.absoluteFilePath(extensionFilename));
        ExtensionBase* extensionBase = qobject_cast<ExtensionBase*>(loader.instance());
        if (extensionBase != nullptr) {
        
            extensionBase->extension()->setDataHolder(m_dataHolder);
            extensionBase->extension()->setParent(extensionBar->container());
            extensionBase->extension()->setSettingsLoader(m_settingsLoader);
            
            QAction* helpMenu = m_menuBar->actions().at(m_menuBar->actions().size() - 1);
            m_menuBar->insertMenu(helpMenu, extensionBase->extension()->menu());
            // Extensions may change the configurations so we reconfigure them
            LoggingConfigurer::configureLoggers();
            // initialize and add to extension bar
            extensionBase->initialize();
            extensionBar->addExtension(extensionBase->extension());
        } else {
            LOG(ERROR) << "Error occured while loading extension [" << loader.fileName() << "]: " << loader.errorString();
        }
    }
}
