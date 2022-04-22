( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b737 - block
    b93 - block
    b520 - block
    b834 - block
    b44 - block
    b775 - block
    b618 - block
    b410 - block
    b154 - block
    b208 - block
    b246 - block
    b796 - block
    b680 - block
    b739 - block
    b773 - block
    b695 - block
    b354 - block
    b704 - block
    b878 - block
    b319 - block
    b568 - block
    b627 - block
    b993 - block
    b805 - block
    b474 - block
    b962 - block
    b721 - block
    b235 - block
    b108 - block
    b234 - block
    b660 - block
    b90 - block
    b144 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b737 )
    ( on b93 b737 )
    ( on b520 b93 )
    ( on b834 b520 )
    ( on b44 b834 )
    ( on b775 b44 )
    ( on b618 b775 )
    ( on b410 b618 )
    ( on b154 b410 )
    ( on b208 b154 )
    ( on b246 b208 )
    ( on b796 b246 )
    ( on b680 b796 )
    ( on b739 b680 )
    ( on b773 b739 )
    ( on b695 b773 )
    ( on b354 b695 )
    ( on b704 b354 )
    ( on b878 b704 )
    ( on b319 b878 )
    ( on b568 b319 )
    ( on b627 b568 )
    ( on b993 b627 )
    ( on b805 b993 )
    ( on b474 b805 )
    ( on b962 b474 )
    ( on b721 b962 )
    ( on b235 b721 )
    ( on b108 b235 )
    ( on b234 b108 )
    ( on b660 b234 )
    ( on b90 b660 )
    ( on b144 b90 )
    ( clear b144 )
  )
  ( :goal
    ( and
      ( clear b737 )
    )
  )
)
