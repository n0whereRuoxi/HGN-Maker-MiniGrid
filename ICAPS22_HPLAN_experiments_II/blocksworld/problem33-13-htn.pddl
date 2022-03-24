( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b558 - block
    b406 - block
    b603 - block
    b870 - block
    b403 - block
    b563 - block
    b700 - block
    b313 - block
    b984 - block
    b197 - block
    b730 - block
    b416 - block
    b306 - block
    b115 - block
    b811 - block
    b771 - block
    b836 - block
    b710 - block
    b105 - block
    b523 - block
    b497 - block
    b534 - block
    b899 - block
    b486 - block
    b47 - block
    b114 - block
    b525 - block
    b692 - block
    b298 - block
    b990 - block
    b175 - block
    b1 - block
    b729 - block
    b931 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b558 )
    ( on b406 b558 )
    ( on b603 b406 )
    ( on b870 b603 )
    ( on b403 b870 )
    ( on b563 b403 )
    ( on b700 b563 )
    ( on b313 b700 )
    ( on b984 b313 )
    ( on b197 b984 )
    ( on b730 b197 )
    ( on b416 b730 )
    ( on b306 b416 )
    ( on b115 b306 )
    ( on b811 b115 )
    ( on b771 b811 )
    ( on b836 b771 )
    ( on b710 b836 )
    ( on b105 b710 )
    ( on b523 b105 )
    ( on b497 b523 )
    ( on b534 b497 )
    ( on b899 b534 )
    ( on b486 b899 )
    ( on b47 b486 )
    ( on b114 b47 )
    ( on b525 b114 )
    ( on b692 b525 )
    ( on b298 b692 )
    ( on b990 b298 )
    ( on b175 b990 )
    ( on b1 b175 )
    ( on b729 b1 )
    ( on b931 b729 )
    ( clear b931 )
  )
  ( :tasks
    ( Make-33Pile b406 b603 b870 b403 b563 b700 b313 b984 b197 b730 b416 b306 b115 b811 b771 b836 b710 b105 b523 b497 b534 b899 b486 b47 b114 b525 b692 b298 b990 b175 b1 b729 b931 )
  )
)
