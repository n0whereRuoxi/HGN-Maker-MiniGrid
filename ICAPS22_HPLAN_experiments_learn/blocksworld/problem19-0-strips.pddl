( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b915 - block
    b513 - block
    b425 - block
    b985 - block
    b185 - block
    b325 - block
    b844 - block
    b888 - block
    b35 - block
    b480 - block
    b248 - block
    b408 - block
    b110 - block
    b667 - block
    b215 - block
    b988 - block
    b859 - block
    b148 - block
    b646 - block
    b846 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b915 )
    ( on b513 b915 )
    ( on b425 b513 )
    ( on b985 b425 )
    ( on b185 b985 )
    ( on b325 b185 )
    ( on b844 b325 )
    ( on b888 b844 )
    ( on b35 b888 )
    ( on b480 b35 )
    ( on b248 b480 )
    ( on b408 b248 )
    ( on b110 b408 )
    ( on b667 b110 )
    ( on b215 b667 )
    ( on b988 b215 )
    ( on b859 b988 )
    ( on b148 b859 )
    ( on b646 b148 )
    ( on b846 b646 )
    ( clear b846 )
  )
  ( :goal
    ( and
      ( clear b915 )
    )
  )
)
