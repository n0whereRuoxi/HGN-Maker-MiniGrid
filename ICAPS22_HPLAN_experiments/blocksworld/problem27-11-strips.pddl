( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b516 - block
    b529 - block
    b897 - block
    b826 - block
    b944 - block
    b624 - block
    b835 - block
    b365 - block
    b630 - block
    b776 - block
    b405 - block
    b691 - block
    b160 - block
    b766 - block
    b367 - block
    b158 - block
    b859 - block
    b79 - block
    b460 - block
    b591 - block
    b179 - block
    b107 - block
    b11 - block
    b562 - block
    b750 - block
    b303 - block
    b459 - block
    b698 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b516 )
    ( on b529 b516 )
    ( on b897 b529 )
    ( on b826 b897 )
    ( on b944 b826 )
    ( on b624 b944 )
    ( on b835 b624 )
    ( on b365 b835 )
    ( on b630 b365 )
    ( on b776 b630 )
    ( on b405 b776 )
    ( on b691 b405 )
    ( on b160 b691 )
    ( on b766 b160 )
    ( on b367 b766 )
    ( on b158 b367 )
    ( on b859 b158 )
    ( on b79 b859 )
    ( on b460 b79 )
    ( on b591 b460 )
    ( on b179 b591 )
    ( on b107 b179 )
    ( on b11 b107 )
    ( on b562 b11 )
    ( on b750 b562 )
    ( on b303 b750 )
    ( on b459 b303 )
    ( on b698 b459 )
    ( clear b698 )
  )
  ( :goal
    ( and
      ( clear b516 )
    )
  )
)
