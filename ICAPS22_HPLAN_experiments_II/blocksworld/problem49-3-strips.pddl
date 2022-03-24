( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b12 - block
    b195 - block
    b439 - block
    b717 - block
    b210 - block
    b592 - block
    b90 - block
    b630 - block
    b744 - block
    b660 - block
    b882 - block
    b997 - block
    b290 - block
    b449 - block
    b606 - block
    b950 - block
    b355 - block
    b68 - block
    b277 - block
    b29 - block
    b160 - block
    b989 - block
    b754 - block
    b966 - block
    b766 - block
    b728 - block
    b374 - block
    b65 - block
    b40 - block
    b318 - block
    b91 - block
    b794 - block
    b406 - block
    b212 - block
    b600 - block
    b965 - block
    b669 - block
    b580 - block
    b849 - block
    b339 - block
    b106 - block
    b154 - block
    b721 - block
    b834 - block
    b568 - block
    b257 - block
    b978 - block
    b720 - block
    b148 - block
    b527 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b12 )
    ( on b195 b12 )
    ( on b439 b195 )
    ( on b717 b439 )
    ( on b210 b717 )
    ( on b592 b210 )
    ( on b90 b592 )
    ( on b630 b90 )
    ( on b744 b630 )
    ( on b660 b744 )
    ( on b882 b660 )
    ( on b997 b882 )
    ( on b290 b997 )
    ( on b449 b290 )
    ( on b606 b449 )
    ( on b950 b606 )
    ( on b355 b950 )
    ( on b68 b355 )
    ( on b277 b68 )
    ( on b29 b277 )
    ( on b160 b29 )
    ( on b989 b160 )
    ( on b754 b989 )
    ( on b966 b754 )
    ( on b766 b966 )
    ( on b728 b766 )
    ( on b374 b728 )
    ( on b65 b374 )
    ( on b40 b65 )
    ( on b318 b40 )
    ( on b91 b318 )
    ( on b794 b91 )
    ( on b406 b794 )
    ( on b212 b406 )
    ( on b600 b212 )
    ( on b965 b600 )
    ( on b669 b965 )
    ( on b580 b669 )
    ( on b849 b580 )
    ( on b339 b849 )
    ( on b106 b339 )
    ( on b154 b106 )
    ( on b721 b154 )
    ( on b834 b721 )
    ( on b568 b834 )
    ( on b257 b568 )
    ( on b978 b257 )
    ( on b720 b978 )
    ( on b148 b720 )
    ( on b527 b148 )
    ( clear b527 )
  )
  ( :goal
    ( and
      ( clear b12 )
    )
  )
)
