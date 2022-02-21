( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b882 - block
    b257 - block
    b860 - block
    b747 - block
    b423 - block
    b54 - block
    b769 - block
    b975 - block
    b228 - block
    b399 - block
    b967 - block
    b699 - block
    b989 - block
    b86 - block
    b61 - block
    b602 - block
    b175 - block
    b765 - block
    b900 - block
    b377 - block
    b687 - block
    b835 - block
    b362 - block
    b441 - block
    b558 - block
    b20 - block
    b633 - block
    b834 - block
    b671 - block
    b507 - block
    b617 - block
    b839 - block
    b30 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b882 )
    ( on b257 b882 )
    ( on b860 b257 )
    ( on b747 b860 )
    ( on b423 b747 )
    ( on b54 b423 )
    ( on b769 b54 )
    ( on b975 b769 )
    ( on b228 b975 )
    ( on b399 b228 )
    ( on b967 b399 )
    ( on b699 b967 )
    ( on b989 b699 )
    ( on b86 b989 )
    ( on b61 b86 )
    ( on b602 b61 )
    ( on b175 b602 )
    ( on b765 b175 )
    ( on b900 b765 )
    ( on b377 b900 )
    ( on b687 b377 )
    ( on b835 b687 )
    ( on b362 b835 )
    ( on b441 b362 )
    ( on b558 b441 )
    ( on b20 b558 )
    ( on b633 b20 )
    ( on b834 b633 )
    ( on b671 b834 )
    ( on b507 b671 )
    ( on b617 b507 )
    ( on b839 b617 )
    ( on b30 b839 )
    ( clear b30 )
  )
  ( :goal
    ( and
      ( clear b882 )
    )
  )
)
