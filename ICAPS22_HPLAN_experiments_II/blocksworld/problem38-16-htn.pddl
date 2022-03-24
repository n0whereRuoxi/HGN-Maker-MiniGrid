( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b106 - block
    b963 - block
    b443 - block
    b484 - block
    b782 - block
    b338 - block
    b189 - block
    b69 - block
    b379 - block
    b610 - block
    b423 - block
    b329 - block
    b754 - block
    b549 - block
    b978 - block
    b321 - block
    b203 - block
    b516 - block
    b683 - block
    b244 - block
    b391 - block
    b781 - block
    b67 - block
    b150 - block
    b829 - block
    b230 - block
    b879 - block
    b628 - block
    b581 - block
    b839 - block
    b285 - block
    b436 - block
    b446 - block
    b291 - block
    b898 - block
    b437 - block
    b925 - block
    b354 - block
    b626 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b106 )
    ( on b963 b106 )
    ( on b443 b963 )
    ( on b484 b443 )
    ( on b782 b484 )
    ( on b338 b782 )
    ( on b189 b338 )
    ( on b69 b189 )
    ( on b379 b69 )
    ( on b610 b379 )
    ( on b423 b610 )
    ( on b329 b423 )
    ( on b754 b329 )
    ( on b549 b754 )
    ( on b978 b549 )
    ( on b321 b978 )
    ( on b203 b321 )
    ( on b516 b203 )
    ( on b683 b516 )
    ( on b244 b683 )
    ( on b391 b244 )
    ( on b781 b391 )
    ( on b67 b781 )
    ( on b150 b67 )
    ( on b829 b150 )
    ( on b230 b829 )
    ( on b879 b230 )
    ( on b628 b879 )
    ( on b581 b628 )
    ( on b839 b581 )
    ( on b285 b839 )
    ( on b436 b285 )
    ( on b446 b436 )
    ( on b291 b446 )
    ( on b898 b291 )
    ( on b437 b898 )
    ( on b925 b437 )
    ( on b354 b925 )
    ( on b626 b354 )
    ( clear b626 )
  )
  ( :tasks
    ( Make-38Pile b963 b443 b484 b782 b338 b189 b69 b379 b610 b423 b329 b754 b549 b978 b321 b203 b516 b683 b244 b391 b781 b67 b150 b829 b230 b879 b628 b581 b839 b285 b436 b446 b291 b898 b437 b925 b354 b626 )
  )
)
