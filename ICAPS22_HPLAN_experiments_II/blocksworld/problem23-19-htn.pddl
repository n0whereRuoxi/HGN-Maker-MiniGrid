( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b920 - block
    b529 - block
    b262 - block
    b709 - block
    b288 - block
    b564 - block
    b142 - block
    b369 - block
    b792 - block
    b296 - block
    b1 - block
    b179 - block
    b354 - block
    b977 - block
    b861 - block
    b931 - block
    b526 - block
    b580 - block
    b678 - block
    b91 - block
    b759 - block
    b135 - block
    b633 - block
    b555 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b920 )
    ( on b529 b920 )
    ( on b262 b529 )
    ( on b709 b262 )
    ( on b288 b709 )
    ( on b564 b288 )
    ( on b142 b564 )
    ( on b369 b142 )
    ( on b792 b369 )
    ( on b296 b792 )
    ( on b1 b296 )
    ( on b179 b1 )
    ( on b354 b179 )
    ( on b977 b354 )
    ( on b861 b977 )
    ( on b931 b861 )
    ( on b526 b931 )
    ( on b580 b526 )
    ( on b678 b580 )
    ( on b91 b678 )
    ( on b759 b91 )
    ( on b135 b759 )
    ( on b633 b135 )
    ( on b555 b633 )
    ( clear b555 )
  )
  ( :tasks
    ( Make-23Pile b529 b262 b709 b288 b564 b142 b369 b792 b296 b1 b179 b354 b977 b861 b931 b526 b580 b678 b91 b759 b135 b633 b555 )
  )
)
