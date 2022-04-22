( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b571 - block
    b528 - block
    b29 - block
    b535 - block
    b876 - block
    b286 - block
    b297 - block
    b809 - block
    b813 - block
    b985 - block
    b367 - block
    b512 - block
    b265 - block
    b685 - block
    b198 - block
    b891 - block
    b709 - block
    b527 - block
    b223 - block
    b914 - block
    b162 - block
    b761 - block
    b757 - block
    b116 - block
    b183 - block
    b22 - block
    b460 - block
    b379 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b571 )
    ( on b528 b571 )
    ( on b29 b528 )
    ( on b535 b29 )
    ( on b876 b535 )
    ( on b286 b876 )
    ( on b297 b286 )
    ( on b809 b297 )
    ( on b813 b809 )
    ( on b985 b813 )
    ( on b367 b985 )
    ( on b512 b367 )
    ( on b265 b512 )
    ( on b685 b265 )
    ( on b198 b685 )
    ( on b891 b198 )
    ( on b709 b891 )
    ( on b527 b709 )
    ( on b223 b527 )
    ( on b914 b223 )
    ( on b162 b914 )
    ( on b761 b162 )
    ( on b757 b761 )
    ( on b116 b757 )
    ( on b183 b116 )
    ( on b22 b183 )
    ( on b460 b22 )
    ( on b379 b460 )
    ( clear b379 )
  )
  ( :goal
    ( and
      ( clear b571 )
    )
  )
)
