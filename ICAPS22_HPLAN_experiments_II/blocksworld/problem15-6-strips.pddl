( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b107 - block
    b768 - block
    b889 - block
    b572 - block
    b491 - block
    b498 - block
    b255 - block
    b848 - block
    b161 - block
    b673 - block
    b902 - block
    b771 - block
    b780 - block
    b812 - block
    b465 - block
    b593 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b107 )
    ( on b768 b107 )
    ( on b889 b768 )
    ( on b572 b889 )
    ( on b491 b572 )
    ( on b498 b491 )
    ( on b255 b498 )
    ( on b848 b255 )
    ( on b161 b848 )
    ( on b673 b161 )
    ( on b902 b673 )
    ( on b771 b902 )
    ( on b780 b771 )
    ( on b812 b780 )
    ( on b465 b812 )
    ( on b593 b465 )
    ( clear b593 )
  )
  ( :goal
    ( and
      ( clear b107 )
    )
  )
)
