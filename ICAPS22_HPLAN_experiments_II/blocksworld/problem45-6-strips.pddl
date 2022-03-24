( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b711 - block
    b187 - block
    b596 - block
    b812 - block
    b591 - block
    b577 - block
    b590 - block
    b713 - block
    b831 - block
    b845 - block
    b890 - block
    b844 - block
    b736 - block
    b255 - block
    b295 - block
    b714 - block
    b638 - block
    b665 - block
    b954 - block
    b173 - block
    b519 - block
    b808 - block
    b498 - block
    b182 - block
    b859 - block
    b617 - block
    b751 - block
    b16 - block
    b246 - block
    b685 - block
    b20 - block
    b283 - block
    b624 - block
    b968 - block
    b659 - block
    b66 - block
    b437 - block
    b390 - block
    b934 - block
    b247 - block
    b8 - block
    b782 - block
    b981 - block
    b575 - block
    b731 - block
    b106 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b711 )
    ( on b187 b711 )
    ( on b596 b187 )
    ( on b812 b596 )
    ( on b591 b812 )
    ( on b577 b591 )
    ( on b590 b577 )
    ( on b713 b590 )
    ( on b831 b713 )
    ( on b845 b831 )
    ( on b890 b845 )
    ( on b844 b890 )
    ( on b736 b844 )
    ( on b255 b736 )
    ( on b295 b255 )
    ( on b714 b295 )
    ( on b638 b714 )
    ( on b665 b638 )
    ( on b954 b665 )
    ( on b173 b954 )
    ( on b519 b173 )
    ( on b808 b519 )
    ( on b498 b808 )
    ( on b182 b498 )
    ( on b859 b182 )
    ( on b617 b859 )
    ( on b751 b617 )
    ( on b16 b751 )
    ( on b246 b16 )
    ( on b685 b246 )
    ( on b20 b685 )
    ( on b283 b20 )
    ( on b624 b283 )
    ( on b968 b624 )
    ( on b659 b968 )
    ( on b66 b659 )
    ( on b437 b66 )
    ( on b390 b437 )
    ( on b934 b390 )
    ( on b247 b934 )
    ( on b8 b247 )
    ( on b782 b8 )
    ( on b981 b782 )
    ( on b575 b981 )
    ( on b731 b575 )
    ( on b106 b731 )
    ( clear b106 )
  )
  ( :goal
    ( and
      ( clear b711 )
    )
  )
)
