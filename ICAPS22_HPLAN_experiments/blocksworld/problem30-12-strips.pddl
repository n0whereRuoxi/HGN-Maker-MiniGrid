( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b265 - block
    b524 - block
    b243 - block
    b985 - block
    b964 - block
    b990 - block
    b656 - block
    b987 - block
    b773 - block
    b701 - block
    b10 - block
    b398 - block
    b891 - block
    b470 - block
    b695 - block
    b347 - block
    b755 - block
    b193 - block
    b980 - block
    b925 - block
    b475 - block
    b736 - block
    b139 - block
    b642 - block
    b228 - block
    b164 - block
    b23 - block
    b250 - block
    b233 - block
    b671 - block
    b2 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b265 )
    ( on b524 b265 )
    ( on b243 b524 )
    ( on b985 b243 )
    ( on b964 b985 )
    ( on b990 b964 )
    ( on b656 b990 )
    ( on b987 b656 )
    ( on b773 b987 )
    ( on b701 b773 )
    ( on b10 b701 )
    ( on b398 b10 )
    ( on b891 b398 )
    ( on b470 b891 )
    ( on b695 b470 )
    ( on b347 b695 )
    ( on b755 b347 )
    ( on b193 b755 )
    ( on b980 b193 )
    ( on b925 b980 )
    ( on b475 b925 )
    ( on b736 b475 )
    ( on b139 b736 )
    ( on b642 b139 )
    ( on b228 b642 )
    ( on b164 b228 )
    ( on b23 b164 )
    ( on b250 b23 )
    ( on b233 b250 )
    ( on b671 b233 )
    ( on b2 b671 )
    ( clear b2 )
  )
  ( :goal
    ( and
      ( clear b265 )
    )
  )
)
