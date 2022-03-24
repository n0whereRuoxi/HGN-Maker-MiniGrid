( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b351 - block
    b838 - block
    b202 - block
    b64 - block
    b364 - block
    b907 - block
    b496 - block
    b36 - block
    b411 - block
    b933 - block
    b788 - block
    b461 - block
    b870 - block
    b659 - block
    b746 - block
    b828 - block
    b926 - block
    b332 - block
    b995 - block
    b506 - block
    b775 - block
    b453 - block
    b900 - block
    b992 - block
    b906 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b351 )
    ( on b838 b351 )
    ( on b202 b838 )
    ( on b64 b202 )
    ( on b364 b64 )
    ( on b907 b364 )
    ( on b496 b907 )
    ( on b36 b496 )
    ( on b411 b36 )
    ( on b933 b411 )
    ( on b788 b933 )
    ( on b461 b788 )
    ( on b870 b461 )
    ( on b659 b870 )
    ( on b746 b659 )
    ( on b828 b746 )
    ( on b926 b828 )
    ( on b332 b926 )
    ( on b995 b332 )
    ( on b506 b995 )
    ( on b775 b506 )
    ( on b453 b775 )
    ( on b900 b453 )
    ( on b992 b900 )
    ( on b906 b992 )
    ( clear b906 )
  )
  ( :goal
    ( and
      ( clear b351 )
    )
  )
)
