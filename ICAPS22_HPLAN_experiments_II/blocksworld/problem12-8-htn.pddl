( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b431 - block
    b69 - block
    b537 - block
    b244 - block
    b123 - block
    b416 - block
    b55 - block
    b17 - block
    b754 - block
    b541 - block
    b920 - block
    b523 - block
    b735 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b431 )
    ( on b69 b431 )
    ( on b537 b69 )
    ( on b244 b537 )
    ( on b123 b244 )
    ( on b416 b123 )
    ( on b55 b416 )
    ( on b17 b55 )
    ( on b754 b17 )
    ( on b541 b754 )
    ( on b920 b541 )
    ( on b523 b920 )
    ( on b735 b523 )
    ( clear b735 )
  )
  ( :tasks
    ( Make-12Pile b69 b537 b244 b123 b416 b55 b17 b754 b541 b920 b523 b735 )
  )
)
