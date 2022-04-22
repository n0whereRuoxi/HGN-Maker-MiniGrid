( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b997 - block
    b695 - block
    b551 - block
    b780 - block
    b444 - block
    b60 - block
    b503 - block
    b698 - block
    b541 - block
    b759 - block
    b601 - block
    b39 - block
    b872 - block
    b688 - block
    b235 - block
    b327 - block
    b782 - block
    b807 - block
    b846 - block
    b412 - block
    b349 - block
    b498 - block
    b483 - block
    b844 - block
    b429 - block
    b885 - block
    b564 - block
    b673 - block
    b137 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b997 )
    ( on b695 b997 )
    ( on b551 b695 )
    ( on b780 b551 )
    ( on b444 b780 )
    ( on b60 b444 )
    ( on b503 b60 )
    ( on b698 b503 )
    ( on b541 b698 )
    ( on b759 b541 )
    ( on b601 b759 )
    ( on b39 b601 )
    ( on b872 b39 )
    ( on b688 b872 )
    ( on b235 b688 )
    ( on b327 b235 )
    ( on b782 b327 )
    ( on b807 b782 )
    ( on b846 b807 )
    ( on b412 b846 )
    ( on b349 b412 )
    ( on b498 b349 )
    ( on b483 b498 )
    ( on b844 b483 )
    ( on b429 b844 )
    ( on b885 b429 )
    ( on b564 b885 )
    ( on b673 b564 )
    ( on b137 b673 )
    ( clear b137 )
  )
  ( :goal
    ( and
      ( clear b997 )
    )
  )
)
