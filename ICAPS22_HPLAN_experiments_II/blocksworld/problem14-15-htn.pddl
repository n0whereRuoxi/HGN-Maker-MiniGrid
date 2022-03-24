( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b691 - block
    b140 - block
    b183 - block
    b742 - block
    b706 - block
    b501 - block
    b355 - block
    b888 - block
    b26 - block
    b360 - block
    b480 - block
    b337 - block
    b686 - block
    b131 - block
    b880 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b691 )
    ( on b140 b691 )
    ( on b183 b140 )
    ( on b742 b183 )
    ( on b706 b742 )
    ( on b501 b706 )
    ( on b355 b501 )
    ( on b888 b355 )
    ( on b26 b888 )
    ( on b360 b26 )
    ( on b480 b360 )
    ( on b337 b480 )
    ( on b686 b337 )
    ( on b131 b686 )
    ( on b880 b131 )
    ( clear b880 )
  )
  ( :tasks
    ( Make-14Pile b140 b183 b742 b706 b501 b355 b888 b26 b360 b480 b337 b686 b131 b880 )
  )
)
