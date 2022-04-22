( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b427 - block
    b170 - block
    b788 - block
    b377 - block
    b753 - block
    b687 - block
    b84 - block
    b908 - block
    b579 - block
    b394 - block
    b118 - block
    b561 - block
    b594 - block
    b792 - block
    b387 - block
    b208 - block
    b45 - block
    b398 - block
    b473 - block
    b932 - block
    b929 - block
    b551 - block
    b257 - block
    b778 - block
    b468 - block
    b743 - block
    b765 - block
    b520 - block
    b160 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b427 )
    ( on b170 b427 )
    ( on b788 b170 )
    ( on b377 b788 )
    ( on b753 b377 )
    ( on b687 b753 )
    ( on b84 b687 )
    ( on b908 b84 )
    ( on b579 b908 )
    ( on b394 b579 )
    ( on b118 b394 )
    ( on b561 b118 )
    ( on b594 b561 )
    ( on b792 b594 )
    ( on b387 b792 )
    ( on b208 b387 )
    ( on b45 b208 )
    ( on b398 b45 )
    ( on b473 b398 )
    ( on b932 b473 )
    ( on b929 b932 )
    ( on b551 b929 )
    ( on b257 b551 )
    ( on b778 b257 )
    ( on b468 b778 )
    ( on b743 b468 )
    ( on b765 b743 )
    ( on b520 b765 )
    ( on b160 b520 )
    ( clear b160 )
  )
  ( :goal
    ( and
      ( clear b427 )
    )
  )
)
