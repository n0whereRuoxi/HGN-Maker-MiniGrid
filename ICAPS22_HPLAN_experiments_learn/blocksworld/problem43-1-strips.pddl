( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b773 - block
    b433 - block
    b139 - block
    b575 - block
    b901 - block
    b806 - block
    b144 - block
    b991 - block
    b270 - block
    b314 - block
    b121 - block
    b207 - block
    b829 - block
    b305 - block
    b408 - block
    b865 - block
    b502 - block
    b464 - block
    b34 - block
    b787 - block
    b112 - block
    b495 - block
    b757 - block
    b941 - block
    b799 - block
    b92 - block
    b413 - block
    b741 - block
    b469 - block
    b133 - block
    b360 - block
    b289 - block
    b786 - block
    b605 - block
    b844 - block
    b566 - block
    b573 - block
    b501 - block
    b919 - block
    b925 - block
    b351 - block
    b511 - block
    b719 - block
    b704 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b773 )
    ( on b433 b773 )
    ( on b139 b433 )
    ( on b575 b139 )
    ( on b901 b575 )
    ( on b806 b901 )
    ( on b144 b806 )
    ( on b991 b144 )
    ( on b270 b991 )
    ( on b314 b270 )
    ( on b121 b314 )
    ( on b207 b121 )
    ( on b829 b207 )
    ( on b305 b829 )
    ( on b408 b305 )
    ( on b865 b408 )
    ( on b502 b865 )
    ( on b464 b502 )
    ( on b34 b464 )
    ( on b787 b34 )
    ( on b112 b787 )
    ( on b495 b112 )
    ( on b757 b495 )
    ( on b941 b757 )
    ( on b799 b941 )
    ( on b92 b799 )
    ( on b413 b92 )
    ( on b741 b413 )
    ( on b469 b741 )
    ( on b133 b469 )
    ( on b360 b133 )
    ( on b289 b360 )
    ( on b786 b289 )
    ( on b605 b786 )
    ( on b844 b605 )
    ( on b566 b844 )
    ( on b573 b566 )
    ( on b501 b573 )
    ( on b919 b501 )
    ( on b925 b919 )
    ( on b351 b925 )
    ( on b511 b351 )
    ( on b719 b511 )
    ( on b704 b719 )
    ( clear b704 )
  )
  ( :goal
    ( and
      ( clear b773 )
    )
  )
)
