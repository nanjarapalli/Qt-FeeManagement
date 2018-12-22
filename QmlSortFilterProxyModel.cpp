#include "QmlSortFilterProxyModel.h"


CQmlSortFilterProxyModel::CQmlSortFilterProxyModel(QObject* pParent)
    : QSortFilterProxyModel(pParent)
{
}

CQmlSortFilterProxyModel::~CQmlSortFilterProxyModel(void)
{
}

void CQmlSortFilterProxyModel::clear(void)
{
    QSortFilterProxyModel::invalidate();
}

void CQmlSortFilterProxyModel::setFilterFixedString(const QString &pattern)
{
    QSortFilterProxyModel::setFilterFixedString(pattern);
}

void CQmlSortFilterProxyModel::setFilterRegExp(const QString& pattern)
{
    QSortFilterProxyModel::setFilterRegExp(pattern);
}

void CQmlSortFilterProxyModel::setFilterWildcard(const QString& pattern)
{
    QSortFilterProxyModel::setFilterWildcard(pattern);
}

QByteArray CQmlSortFilterProxyModel::filterRoleName(void) const
{
    return m_filterRoleName;
}

void CQmlSortFilterProxyModel::setFilterRoleName(const QByteArray& name)
{
    if (m_filterRoleName != name)
    {
        m_filterRoleName = name;
        emit filterRoleNameChanged();

        applyFilterRoleName();
    }
}

void CQmlSortFilterProxyModel::setSourceModel(QAbstractItemModel* pSourceModel)
{
    QSortFilterProxyModel::setSourceModel(pSourceModel);
    applyFilterRoleName();
    applySortRoleName();
}

bool CQmlSortFilterProxyModel::caseSensitiveFilter(void) const
{
    return (filterCaseSensitivity() == Qt::CaseSensitive);
}

void CQmlSortFilterProxyModel::setCaseSensitiveFilter(bool bCaseSensitive)
{
    if (caseSensitiveFilter() != bCaseSensitive)
    {
        Qt::CaseSensitivity caseSensitivity = bCaseSensitive ?
            Qt::CaseSensitive : Qt::CaseInsensitive;
        setFilterCaseSensitivity(caseSensitivity);
        emit caseSensitiveFilterChanged();
    }
}

void CQmlSortFilterProxyModel::applyFilterRoleName(void)
{
    QAbstractItemModel* pSourceModel = sourceModel();
    if (pSourceModel != nullptr)
    {
        QHash<int, QByteArray> sourceRoleNames = pSourceModel->roleNames();
        int role = sourceRoleNames.key(m_filterRoleName);
        setFilterRole(role);
    }
}

void CQmlSortFilterProxyModel::sort(int sortOrder)
{
    QSortFilterProxyModel::sort(0,static_cast<Qt::SortOrder>(sortOrder));
}

QByteArray CQmlSortFilterProxyModel::sortRoleName(void) const
{
    return m_sortRoleName;
}

void CQmlSortFilterProxyModel::setSortRoleName(const QByteArray& name)
{
    if (m_sortRoleName != name)
    {
        m_sortRoleName = name;
        emit sortRoleNameChanged();

        applySortRoleName();
    }
}

void CQmlSortFilterProxyModel::applySortRoleName(void)
{
    QAbstractItemModel* pSourceModel = sourceModel();
    if (pSourceModel != nullptr)
    {
        QHash<int, QByteArray> sourceRoleNames = pSourceModel->roleNames();
        int role = sourceRoleNames.key(m_sortRoleName);
        setSortRole(role);
    }
}
