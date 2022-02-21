( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b73 - block
    b440 - block
    b505 - block
    b164 - block
    b888 - block
    b947 - block
    b663 - block
    b46 - block
    b917 - block
    b166 - block
    b875 - block
    b978 - block
    b869 - block
    b723 - block
    b743 - block
    b121 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b73 )
    ( on b440 b73 )
    ( on b505 b440 )
    ( on b164 b505 )
    ( on b888 b164 )
    ( on b947 b888 )
    ( on b663 b947 )
    ( on b46 b663 )
    ( on b917 b46 )
    ( on b166 b917 )
    ( on b875 b166 )
    ( on b978 b875 )
    ( on b869 b978 )
    ( on b723 b869 )
    ( on b743 b723 )
    ( on b121 b743 )
    ( clear b121 )
  )
  ( :goal
    ( and
      ( clear b73 )
    )
  )
)
