( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b742 - block
    b584 - block
    b53 - block
    b656 - block
    b915 - block
    b321 - block
    b614 - block
    b32 - block
    b700 - block
    b326 - block
    b913 - block
    b72 - block
    b480 - block
    b591 - block
    b118 - block
    b12 - block
    b504 - block
    b142 - block
    b563 - block
    b745 - block
    b249 - block
    b513 - block
    b171 - block
    b78 - block
    b524 - block
    b287 - block
    b536 - block
    b892 - block
    b864 - block
    b672 - block
    b381 - block
    b954 - block
    b41 - block
    b609 - block
    b27 - block
    b37 - block
    b617 - block
    b701 - block
    b566 - block
    b329 - block
    b176 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b742 )
    ( on b584 b742 )
    ( on b53 b584 )
    ( on b656 b53 )
    ( on b915 b656 )
    ( on b321 b915 )
    ( on b614 b321 )
    ( on b32 b614 )
    ( on b700 b32 )
    ( on b326 b700 )
    ( on b913 b326 )
    ( on b72 b913 )
    ( on b480 b72 )
    ( on b591 b480 )
    ( on b118 b591 )
    ( on b12 b118 )
    ( on b504 b12 )
    ( on b142 b504 )
    ( on b563 b142 )
    ( on b745 b563 )
    ( on b249 b745 )
    ( on b513 b249 )
    ( on b171 b513 )
    ( on b78 b171 )
    ( on b524 b78 )
    ( on b287 b524 )
    ( on b536 b287 )
    ( on b892 b536 )
    ( on b864 b892 )
    ( on b672 b864 )
    ( on b381 b672 )
    ( on b954 b381 )
    ( on b41 b954 )
    ( on b609 b41 )
    ( on b27 b609 )
    ( on b37 b27 )
    ( on b617 b37 )
    ( on b701 b617 )
    ( on b566 b701 )
    ( on b329 b566 )
    ( on b176 b329 )
    ( clear b176 )
  )
  ( :tasks
    ( Make-40Pile b584 b53 b656 b915 b321 b614 b32 b700 b326 b913 b72 b480 b591 b118 b12 b504 b142 b563 b745 b249 b513 b171 b78 b524 b287 b536 b892 b864 b672 b381 b954 b41 b609 b27 b37 b617 b701 b566 b329 b176 )
  )
)
