( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b840 - block
    b631 - block
    b782 - block
    b291 - block
    b484 - block
    b712 - block
    b316 - block
    b710 - block
    b977 - block
    b525 - block
    b652 - block
    b532 - block
    b335 - block
    b731 - block
    b126 - block
    b628 - block
    b207 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b840 )
    ( on b631 b840 )
    ( on b782 b631 )
    ( on b291 b782 )
    ( on b484 b291 )
    ( on b712 b484 )
    ( on b316 b712 )
    ( on b710 b316 )
    ( on b977 b710 )
    ( on b525 b977 )
    ( on b652 b525 )
    ( on b532 b652 )
    ( on b335 b532 )
    ( on b731 b335 )
    ( on b126 b731 )
    ( on b628 b126 )
    ( on b207 b628 )
    ( clear b207 )
  )
  ( :tasks
    ( Make-16Pile b631 b782 b291 b484 b712 b316 b710 b977 b525 b652 b532 b335 b731 b126 b628 b207 )
  )
)
