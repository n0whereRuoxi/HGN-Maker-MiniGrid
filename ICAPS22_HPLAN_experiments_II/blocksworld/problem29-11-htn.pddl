( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b205 - block
    b905 - block
    b392 - block
    b377 - block
    b436 - block
    b845 - block
    b463 - block
    b926 - block
    b531 - block
    b142 - block
    b262 - block
    b908 - block
    b990 - block
    b657 - block
    b222 - block
    b282 - block
    b104 - block
    b557 - block
    b719 - block
    b793 - block
    b800 - block
    b631 - block
    b968 - block
    b10 - block
    b440 - block
    b940 - block
    b356 - block
    b989 - block
    b550 - block
    b720 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b205 )
    ( on b905 b205 )
    ( on b392 b905 )
    ( on b377 b392 )
    ( on b436 b377 )
    ( on b845 b436 )
    ( on b463 b845 )
    ( on b926 b463 )
    ( on b531 b926 )
    ( on b142 b531 )
    ( on b262 b142 )
    ( on b908 b262 )
    ( on b990 b908 )
    ( on b657 b990 )
    ( on b222 b657 )
    ( on b282 b222 )
    ( on b104 b282 )
    ( on b557 b104 )
    ( on b719 b557 )
    ( on b793 b719 )
    ( on b800 b793 )
    ( on b631 b800 )
    ( on b968 b631 )
    ( on b10 b968 )
    ( on b440 b10 )
    ( on b940 b440 )
    ( on b356 b940 )
    ( on b989 b356 )
    ( on b550 b989 )
    ( on b720 b550 )
    ( clear b720 )
  )
  ( :tasks
    ( Make-29Pile b905 b392 b377 b436 b845 b463 b926 b531 b142 b262 b908 b990 b657 b222 b282 b104 b557 b719 b793 b800 b631 b968 b10 b440 b940 b356 b989 b550 b720 )
  )
)
