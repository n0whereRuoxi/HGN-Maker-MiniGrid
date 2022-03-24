( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b848 - block
    b638 - block
    b103 - block
    b454 - block
    b145 - block
    b808 - block
    b184 - block
    b690 - block
    b378 - block
    b925 - block
    b525 - block
    b742 - block
    b261 - block
    b398 - block
    b668 - block
    b180 - block
    b777 - block
    b391 - block
    b867 - block
    b502 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b848 )
    ( on b638 b848 )
    ( on b103 b638 )
    ( on b454 b103 )
    ( on b145 b454 )
    ( on b808 b145 )
    ( on b184 b808 )
    ( on b690 b184 )
    ( on b378 b690 )
    ( on b925 b378 )
    ( on b525 b925 )
    ( on b742 b525 )
    ( on b261 b742 )
    ( on b398 b261 )
    ( on b668 b398 )
    ( on b180 b668 )
    ( on b777 b180 )
    ( on b391 b777 )
    ( on b867 b391 )
    ( on b502 b867 )
    ( clear b502 )
  )
  ( :tasks
    ( Make-19Pile b638 b103 b454 b145 b808 b184 b690 b378 b925 b525 b742 b261 b398 b668 b180 b777 b391 b867 b502 )
  )
)
