( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b356 - block
    b439 - block
    b473 - block
    b606 - block
    b843 - block
    b123 - block
    b334 - block
    b276 - block
    b95 - block
    b167 - block
    b782 - block
    b882 - block
    b537 - block
    b591 - block
    b431 - block
    b803 - block
    b113 - block
    b842 - block
    b249 - block
    b725 - block
    b617 - block
    b225 - block
    b737 - block
    b829 - block
    b919 - block
    b776 - block
    b906 - block
    b633 - block
    b104 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b356 )
    ( on b439 b356 )
    ( on b473 b439 )
    ( on b606 b473 )
    ( on b843 b606 )
    ( on b123 b843 )
    ( on b334 b123 )
    ( on b276 b334 )
    ( on b95 b276 )
    ( on b167 b95 )
    ( on b782 b167 )
    ( on b882 b782 )
    ( on b537 b882 )
    ( on b591 b537 )
    ( on b431 b591 )
    ( on b803 b431 )
    ( on b113 b803 )
    ( on b842 b113 )
    ( on b249 b842 )
    ( on b725 b249 )
    ( on b617 b725 )
    ( on b225 b617 )
    ( on b737 b225 )
    ( on b829 b737 )
    ( on b919 b829 )
    ( on b776 b919 )
    ( on b906 b776 )
    ( on b633 b906 )
    ( on b104 b633 )
    ( clear b104 )
  )
  ( :tasks
    ( Make-28Pile b439 b473 b606 b843 b123 b334 b276 b95 b167 b782 b882 b537 b591 b431 b803 b113 b842 b249 b725 b617 b225 b737 b829 b919 b776 b906 b633 b104 )
  )
)
