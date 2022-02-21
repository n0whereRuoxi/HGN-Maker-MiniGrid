( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b570 - block
    b304 - block
    b183 - block
    b26 - block
    b268 - block
    b979 - block
    b142 - block
    b999 - block
    b689 - block
    b814 - block
    b513 - block
    b231 - block
    b684 - block
    b387 - block
    b330 - block
    b471 - block
    b176 - block
    b166 - block
    b705 - block
    b941 - block
    b389 - block
    b28 - block
    b353 - block
    b269 - block
    b82 - block
    b926 - block
    b100 - block
    b638 - block
    b830 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b570 )
    ( on b304 b570 )
    ( on b183 b304 )
    ( on b26 b183 )
    ( on b268 b26 )
    ( on b979 b268 )
    ( on b142 b979 )
    ( on b999 b142 )
    ( on b689 b999 )
    ( on b814 b689 )
    ( on b513 b814 )
    ( on b231 b513 )
    ( on b684 b231 )
    ( on b387 b684 )
    ( on b330 b387 )
    ( on b471 b330 )
    ( on b176 b471 )
    ( on b166 b176 )
    ( on b705 b166 )
    ( on b941 b705 )
    ( on b389 b941 )
    ( on b28 b389 )
    ( on b353 b28 )
    ( on b269 b353 )
    ( on b82 b269 )
    ( on b926 b82 )
    ( on b100 b926 )
    ( on b638 b100 )
    ( on b830 b638 )
    ( clear b830 )
  )
  ( :goal
    ( and
      ( clear b570 )
    )
  )
)
