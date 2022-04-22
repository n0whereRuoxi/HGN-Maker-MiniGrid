( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b684 - block
    b154 - block
    b267 - block
    b914 - block
    b350 - block
    b124 - block
    b113 - block
    b32 - block
    b145 - block
    b469 - block
    b493 - block
    b503 - block
    b819 - block
    b364 - block
    b274 - block
    b399 - block
    b611 - block
    b462 - block
    b158 - block
    b525 - block
    b807 - block
    b315 - block
    b526 - block
    b140 - block
    b227 - block
    b11 - block
    b452 - block
    b436 - block
    b636 - block
    b863 - block
    b167 - block
    b217 - block
    b213 - block
    b130 - block
    b144 - block
    b55 - block
    b195 - block
    b83 - block
    b16 - block
    b593 - block
    b824 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b684 )
    ( on b154 b684 )
    ( on b267 b154 )
    ( on b914 b267 )
    ( on b350 b914 )
    ( on b124 b350 )
    ( on b113 b124 )
    ( on b32 b113 )
    ( on b145 b32 )
    ( on b469 b145 )
    ( on b493 b469 )
    ( on b503 b493 )
    ( on b819 b503 )
    ( on b364 b819 )
    ( on b274 b364 )
    ( on b399 b274 )
    ( on b611 b399 )
    ( on b462 b611 )
    ( on b158 b462 )
    ( on b525 b158 )
    ( on b807 b525 )
    ( on b315 b807 )
    ( on b526 b315 )
    ( on b140 b526 )
    ( on b227 b140 )
    ( on b11 b227 )
    ( on b452 b11 )
    ( on b436 b452 )
    ( on b636 b436 )
    ( on b863 b636 )
    ( on b167 b863 )
    ( on b217 b167 )
    ( on b213 b217 )
    ( on b130 b213 )
    ( on b144 b130 )
    ( on b55 b144 )
    ( on b195 b55 )
    ( on b83 b195 )
    ( on b16 b83 )
    ( on b593 b16 )
    ( on b824 b593 )
    ( clear b824 )
  )
  ( :goal
    ( and
      ( clear b684 )
    )
  )
)
