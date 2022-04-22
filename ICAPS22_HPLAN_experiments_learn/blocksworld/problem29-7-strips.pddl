( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b293 - block
    b261 - block
    b530 - block
    b630 - block
    b823 - block
    b745 - block
    b398 - block
    b523 - block
    b454 - block
    b948 - block
    b207 - block
    b316 - block
    b32 - block
    b471 - block
    b887 - block
    b193 - block
    b835 - block
    b262 - block
    b431 - block
    b642 - block
    b22 - block
    b615 - block
    b606 - block
    b724 - block
    b341 - block
    b984 - block
    b557 - block
    b225 - block
    b250 - block
    b329 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b293 )
    ( on b261 b293 )
    ( on b530 b261 )
    ( on b630 b530 )
    ( on b823 b630 )
    ( on b745 b823 )
    ( on b398 b745 )
    ( on b523 b398 )
    ( on b454 b523 )
    ( on b948 b454 )
    ( on b207 b948 )
    ( on b316 b207 )
    ( on b32 b316 )
    ( on b471 b32 )
    ( on b887 b471 )
    ( on b193 b887 )
    ( on b835 b193 )
    ( on b262 b835 )
    ( on b431 b262 )
    ( on b642 b431 )
    ( on b22 b642 )
    ( on b615 b22 )
    ( on b606 b615 )
    ( on b724 b606 )
    ( on b341 b724 )
    ( on b984 b341 )
    ( on b557 b984 )
    ( on b225 b557 )
    ( on b250 b225 )
    ( on b329 b250 )
    ( clear b329 )
  )
  ( :goal
    ( and
      ( clear b293 )
    )
  )
)
