( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b864 - block
    b776 - block
    b643 - block
    b523 - block
    b466 - block
    b831 - block
    b16 - block
    b530 - block
    b990 - block
    b801 - block
    b899 - block
    b455 - block
    b721 - block
    b706 - block
    b374 - block
    b429 - block
    b277 - block
    b191 - block
    b19 - block
    b590 - block
    b391 - block
    b196 - block
    b331 - block
    b398 - block
    b639 - block
    b898 - block
    b802 - block
    b534 - block
    b795 - block
    b792 - block
    b9 - block
    b194 - block
    b450 - block
    b724 - block
    b159 - block
    b959 - block
    b50 - block
    b794 - block
    b296 - block
    b481 - block
    b656 - block
    b467 - block
    b767 - block
    b1 - block
    b254 - block
    b998 - block
    b355 - block
    b325 - block
    b463 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b864 )
    ( on b776 b864 )
    ( on b643 b776 )
    ( on b523 b643 )
    ( on b466 b523 )
    ( on b831 b466 )
    ( on b16 b831 )
    ( on b530 b16 )
    ( on b990 b530 )
    ( on b801 b990 )
    ( on b899 b801 )
    ( on b455 b899 )
    ( on b721 b455 )
    ( on b706 b721 )
    ( on b374 b706 )
    ( on b429 b374 )
    ( on b277 b429 )
    ( on b191 b277 )
    ( on b19 b191 )
    ( on b590 b19 )
    ( on b391 b590 )
    ( on b196 b391 )
    ( on b331 b196 )
    ( on b398 b331 )
    ( on b639 b398 )
    ( on b898 b639 )
    ( on b802 b898 )
    ( on b534 b802 )
    ( on b795 b534 )
    ( on b792 b795 )
    ( on b9 b792 )
    ( on b194 b9 )
    ( on b450 b194 )
    ( on b724 b450 )
    ( on b159 b724 )
    ( on b959 b159 )
    ( on b50 b959 )
    ( on b794 b50 )
    ( on b296 b794 )
    ( on b481 b296 )
    ( on b656 b481 )
    ( on b467 b656 )
    ( on b767 b467 )
    ( on b1 b767 )
    ( on b254 b1 )
    ( on b998 b254 )
    ( on b355 b998 )
    ( on b325 b355 )
    ( on b463 b325 )
    ( clear b463 )
  )
  ( :goal
    ( and
      ( clear b864 )
    )
  )
)
