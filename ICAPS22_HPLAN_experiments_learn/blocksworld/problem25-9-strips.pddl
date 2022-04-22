( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b903 - block
    b41 - block
    b738 - block
    b480 - block
    b799 - block
    b590 - block
    b975 - block
    b89 - block
    b180 - block
    b999 - block
    b188 - block
    b198 - block
    b256 - block
    b529 - block
    b988 - block
    b139 - block
    b897 - block
    b231 - block
    b167 - block
    b442 - block
    b978 - block
    b964 - block
    b2 - block
    b762 - block
    b291 - block
    b467 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b903 )
    ( on b41 b903 )
    ( on b738 b41 )
    ( on b480 b738 )
    ( on b799 b480 )
    ( on b590 b799 )
    ( on b975 b590 )
    ( on b89 b975 )
    ( on b180 b89 )
    ( on b999 b180 )
    ( on b188 b999 )
    ( on b198 b188 )
    ( on b256 b198 )
    ( on b529 b256 )
    ( on b988 b529 )
    ( on b139 b988 )
    ( on b897 b139 )
    ( on b231 b897 )
    ( on b167 b231 )
    ( on b442 b167 )
    ( on b978 b442 )
    ( on b964 b978 )
    ( on b2 b964 )
    ( on b762 b2 )
    ( on b291 b762 )
    ( on b467 b291 )
    ( clear b467 )
  )
  ( :goal
    ( and
      ( clear b903 )
    )
  )
)
