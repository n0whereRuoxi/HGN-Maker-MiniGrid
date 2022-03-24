( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b171 - block
    b796 - block
    b468 - block
    b143 - block
    b585 - block
    b560 - block
    b55 - block
    b307 - block
    b927 - block
    b372 - block
    b962 - block
    b186 - block
    b132 - block
    b124 - block
    b236 - block
    b703 - block
    b36 - block
    b756 - block
    b325 - block
    b271 - block
    b253 - block
    b315 - block
    b543 - block
    b905 - block
    b439 - block
    b561 - block
    b676 - block
    b775 - block
    b249 - block
    b597 - block
    b653 - block
    b878 - block
    b777 - block
    b814 - block
    b999 - block
    b533 - block
    b62 - block
    b385 - block
    b819 - block
    b549 - block
    b855 - block
    b663 - block
    b408 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b171 )
    ( on b796 b171 )
    ( on b468 b796 )
    ( on b143 b468 )
    ( on b585 b143 )
    ( on b560 b585 )
    ( on b55 b560 )
    ( on b307 b55 )
    ( on b927 b307 )
    ( on b372 b927 )
    ( on b962 b372 )
    ( on b186 b962 )
    ( on b132 b186 )
    ( on b124 b132 )
    ( on b236 b124 )
    ( on b703 b236 )
    ( on b36 b703 )
    ( on b756 b36 )
    ( on b325 b756 )
    ( on b271 b325 )
    ( on b253 b271 )
    ( on b315 b253 )
    ( on b543 b315 )
    ( on b905 b543 )
    ( on b439 b905 )
    ( on b561 b439 )
    ( on b676 b561 )
    ( on b775 b676 )
    ( on b249 b775 )
    ( on b597 b249 )
    ( on b653 b597 )
    ( on b878 b653 )
    ( on b777 b878 )
    ( on b814 b777 )
    ( on b999 b814 )
    ( on b533 b999 )
    ( on b62 b533 )
    ( on b385 b62 )
    ( on b819 b385 )
    ( on b549 b819 )
    ( on b855 b549 )
    ( on b663 b855 )
    ( on b408 b663 )
    ( clear b408 )
  )
  ( :goal
    ( and
      ( clear b171 )
    )
  )
)
