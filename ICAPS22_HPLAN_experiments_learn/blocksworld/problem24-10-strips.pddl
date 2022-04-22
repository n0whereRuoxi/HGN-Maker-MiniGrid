( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b266 - block
    b404 - block
    b236 - block
    b113 - block
    b859 - block
    b30 - block
    b994 - block
    b185 - block
    b983 - block
    b954 - block
    b673 - block
    b247 - block
    b127 - block
    b558 - block
    b323 - block
    b162 - block
    b248 - block
    b33 - block
    b129 - block
    b780 - block
    b87 - block
    b110 - block
    b637 - block
    b433 - block
    b213 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b266 )
    ( on b404 b266 )
    ( on b236 b404 )
    ( on b113 b236 )
    ( on b859 b113 )
    ( on b30 b859 )
    ( on b994 b30 )
    ( on b185 b994 )
    ( on b983 b185 )
    ( on b954 b983 )
    ( on b673 b954 )
    ( on b247 b673 )
    ( on b127 b247 )
    ( on b558 b127 )
    ( on b323 b558 )
    ( on b162 b323 )
    ( on b248 b162 )
    ( on b33 b248 )
    ( on b129 b33 )
    ( on b780 b129 )
    ( on b87 b780 )
    ( on b110 b87 )
    ( on b637 b110 )
    ( on b433 b637 )
    ( on b213 b433 )
    ( clear b213 )
  )
  ( :goal
    ( and
      ( clear b266 )
    )
  )
)
