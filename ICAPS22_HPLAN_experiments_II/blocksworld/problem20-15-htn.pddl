( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b853 - block
    b659 - block
    b237 - block
    b613 - block
    b564 - block
    b468 - block
    b539 - block
    b982 - block
    b225 - block
    b144 - block
    b111 - block
    b854 - block
    b866 - block
    b155 - block
    b433 - block
    b733 - block
    b799 - block
    b362 - block
    b203 - block
    b174 - block
    b61 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b853 )
    ( on b659 b853 )
    ( on b237 b659 )
    ( on b613 b237 )
    ( on b564 b613 )
    ( on b468 b564 )
    ( on b539 b468 )
    ( on b982 b539 )
    ( on b225 b982 )
    ( on b144 b225 )
    ( on b111 b144 )
    ( on b854 b111 )
    ( on b866 b854 )
    ( on b155 b866 )
    ( on b433 b155 )
    ( on b733 b433 )
    ( on b799 b733 )
    ( on b362 b799 )
    ( on b203 b362 )
    ( on b174 b203 )
    ( on b61 b174 )
    ( clear b61 )
  )
  ( :tasks
    ( Make-20Pile b659 b237 b613 b564 b468 b539 b982 b225 b144 b111 b854 b866 b155 b433 b733 b799 b362 b203 b174 b61 )
  )
)
