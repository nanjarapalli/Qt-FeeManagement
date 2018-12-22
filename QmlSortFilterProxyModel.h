#ifndef QMLSORTFILTERPROXYMODEL_H
#define QMLSORTFILTERPROXYMODEL_H


#include <QSortFilterProxyModel>


class CQmlSortFilterProxyModel : public QSortFilterProxyModel
{
    Q_OBJECT

    Q_PROPERTY(QByteArray filterRoleName READ filterRoleName WRITE setFilterRoleName NOTIFY filterRoleNameChanged)
    Q_PROPERTY(bool caseSensitiveFilter READ caseSensitiveFilter WRITE setCaseSensitiveFilter NOTIFY caseSensitiveFilterChanged)
    Q_PROPERTY(QByteArray sortRoleName READ sortRoleName WRITE setSortRoleName NOTIFY sortRoleNameChanged)
private:
    QByteArray m_filterRoleName;
    QByteArray m_sortRoleName;
private:
    void applyFilterRoleName(void);
    void applySortRoleName(void);
public:
    explicit CQmlSortFilterProxyModel(QObject* pParent = nullptr);
    virtual ~CQmlSortFilterProxyModel(void);
public:
    Q_INVOKABLE void clear(void);
    Q_INVOKABLE void setFilterFixedString(const QString& pattern);
    Q_INVOKABLE void setFilterRegExp(const QString& pattern);
    Q_INVOKABLE void setFilterWildcard(const QString& pattern);
    QByteArray filterRoleName(void) const;
    void setFilterRoleName(const QByteArray& name);
    bool caseSensitiveFilter(void) const;
    void setCaseSensitiveFilter(bool bCaseSensitive);
    void setSourceModel(QAbstractItemModel* pSourceModel);
    Q_INVOKABLE void sort(int sortOrder);
    QByteArray sortRoleName(void) const;
    void setSortRoleName(const QByteArray& name);
signals:
    void caseSensitiveFilterChanged();
    void filterRoleNameChanged();
    void sortRoleNameChanged();
};

#endif // QMLSORTFILTERPROXYMODEL_H
