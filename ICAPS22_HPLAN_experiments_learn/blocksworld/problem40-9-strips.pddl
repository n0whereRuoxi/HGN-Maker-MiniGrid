( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b791 - block
    b396 - block
    b385 - block
    b283 - block
    b826 - block
    b952 - block
    b888 - block
    b753 - block
    b655 - block
    b48 - block
    b557 - block
    b240 - block
    b852 - block
    b945 - block
    b672 - block
    b675 - block
    b340 - block
    b706 - block
    b729 - block
    b225 - block
    b602 - block
    b365 - block
    b589 - block
    b474 - block
    b946 - block
    b796 - block
    b997 - block
    b482 - block
    b947 - block
    b413 - block
    b73 - block
    b453 - block
    b880 - block
    b327 - block
    b606 - block
    b196 - block
    b362 - block
    b774 - block
    b185 - block
    b495 - block
    b480 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b791 )
    ( on b396 b791 )
    ( on b385 b396 )
    ( on b283 b385 )
    ( on b826 b283 )
    ( on b952 b826 )
    ( on b888 b952 )
    ( on b753 b888 )
    ( on b655 b753 )
    ( on b48 b655 )
    ( on b557 b48 )
    ( on b240 b557 )
    ( on b852 b240 )
    ( on b945 b852 )
    ( on b672 b945 )
    ( on b675 b672 )
    ( on b340 b675 )
    ( on b706 b340 )
    ( on b729 b706 )
    ( on b225 b729 )
    ( on b602 b225 )
    ( on b365 b602 )
    ( on b589 b365 )
    ( on b474 b589 )
    ( on b946 b474 )
    ( on b796 b946 )
    ( on b997 b796 )
    ( on b482 b997 )
    ( on b947 b482 )
    ( on b413 b947 )
    ( on b73 b413 )
    ( on b453 b73 )
    ( on b880 b453 )
    ( on b327 b880 )
    ( on b606 b327 )
    ( on b196 b606 )
    ( on b362 b196 )
    ( on b774 b362 )
    ( on b185 b774 )
    ( on b495 b185 )
    ( on b480 b495 )
    ( clear b480 )
  )
  ( :goal
    ( and
      ( clear b791 )
    )
  )
)
