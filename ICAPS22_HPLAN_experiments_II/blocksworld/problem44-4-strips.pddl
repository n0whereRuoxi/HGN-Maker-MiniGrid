( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b681 - block
    b294 - block
    b705 - block
    b700 - block
    b139 - block
    b242 - block
    b582 - block
    b833 - block
    b758 - block
    b866 - block
    b840 - block
    b593 - block
    b410 - block
    b250 - block
    b296 - block
    b722 - block
    b942 - block
    b223 - block
    b272 - block
    b392 - block
    b285 - block
    b224 - block
    b217 - block
    b576 - block
    b797 - block
    b864 - block
    b53 - block
    b312 - block
    b110 - block
    b544 - block
    b491 - block
    b232 - block
    b906 - block
    b142 - block
    b759 - block
    b820 - block
    b650 - block
    b846 - block
    b455 - block
    b364 - block
    b333 - block
    b168 - block
    b834 - block
    b193 - block
    b782 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b681 )
    ( on b294 b681 )
    ( on b705 b294 )
    ( on b700 b705 )
    ( on b139 b700 )
    ( on b242 b139 )
    ( on b582 b242 )
    ( on b833 b582 )
    ( on b758 b833 )
    ( on b866 b758 )
    ( on b840 b866 )
    ( on b593 b840 )
    ( on b410 b593 )
    ( on b250 b410 )
    ( on b296 b250 )
    ( on b722 b296 )
    ( on b942 b722 )
    ( on b223 b942 )
    ( on b272 b223 )
    ( on b392 b272 )
    ( on b285 b392 )
    ( on b224 b285 )
    ( on b217 b224 )
    ( on b576 b217 )
    ( on b797 b576 )
    ( on b864 b797 )
    ( on b53 b864 )
    ( on b312 b53 )
    ( on b110 b312 )
    ( on b544 b110 )
    ( on b491 b544 )
    ( on b232 b491 )
    ( on b906 b232 )
    ( on b142 b906 )
    ( on b759 b142 )
    ( on b820 b759 )
    ( on b650 b820 )
    ( on b846 b650 )
    ( on b455 b846 )
    ( on b364 b455 )
    ( on b333 b364 )
    ( on b168 b333 )
    ( on b834 b168 )
    ( on b193 b834 )
    ( on b782 b193 )
    ( clear b782 )
  )
  ( :goal
    ( and
      ( clear b681 )
    )
  )
)
