( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b186 - block
    b698 - block
    b188 - block
    b902 - block
    b611 - block
    b330 - block
    b386 - block
    b299 - block
    b850 - block
    b522 - block
    b577 - block
    b95 - block
    b377 - block
    b594 - block
    b164 - block
    b614 - block
    b99 - block
    b700 - block
    b427 - block
    b765 - block
    b323 - block
    b980 - block
    b282 - block
    b345 - block
    b379 - block
    b803 - block
    b319 - block
    b678 - block
    b454 - block
    b239 - block
    b608 - block
    b855 - block
    b937 - block
    b861 - block
    b866 - block
    b888 - block
    b156 - block
    b33 - block
    b787 - block
    b24 - block
    b119 - block
    b727 - block
    b579 - block
    b921 - block
    b737 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b186 )
    ( on b698 b186 )
    ( on b188 b698 )
    ( on b902 b188 )
    ( on b611 b902 )
    ( on b330 b611 )
    ( on b386 b330 )
    ( on b299 b386 )
    ( on b850 b299 )
    ( on b522 b850 )
    ( on b577 b522 )
    ( on b95 b577 )
    ( on b377 b95 )
    ( on b594 b377 )
    ( on b164 b594 )
    ( on b614 b164 )
    ( on b99 b614 )
    ( on b700 b99 )
    ( on b427 b700 )
    ( on b765 b427 )
    ( on b323 b765 )
    ( on b980 b323 )
    ( on b282 b980 )
    ( on b345 b282 )
    ( on b379 b345 )
    ( on b803 b379 )
    ( on b319 b803 )
    ( on b678 b319 )
    ( on b454 b678 )
    ( on b239 b454 )
    ( on b608 b239 )
    ( on b855 b608 )
    ( on b937 b855 )
    ( on b861 b937 )
    ( on b866 b861 )
    ( on b888 b866 )
    ( on b156 b888 )
    ( on b33 b156 )
    ( on b787 b33 )
    ( on b24 b787 )
    ( on b119 b24 )
    ( on b727 b119 )
    ( on b579 b727 )
    ( on b921 b579 )
    ( on b737 b921 )
    ( clear b737 )
  )
  ( :goal
    ( and
      ( clear b186 )
    )
  )
)
