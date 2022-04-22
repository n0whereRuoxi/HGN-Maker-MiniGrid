( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b608 - block
    b637 - block
    b963 - block
    b866 - block
    b688 - block
    b488 - block
    b45 - block
    b104 - block
    b447 - block
    b845 - block
    b252 - block
    b450 - block
    b189 - block
    b138 - block
    b144 - block
    b458 - block
    b391 - block
    b376 - block
    b626 - block
    b52 - block
    b766 - block
    b594 - block
    b757 - block
    b385 - block
    b701 - block
    b321 - block
    b593 - block
    b959 - block
    b821 - block
    b26 - block
    b426 - block
    b703 - block
    b638 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b608 )
    ( on b637 b608 )
    ( on b963 b637 )
    ( on b866 b963 )
    ( on b688 b866 )
    ( on b488 b688 )
    ( on b45 b488 )
    ( on b104 b45 )
    ( on b447 b104 )
    ( on b845 b447 )
    ( on b252 b845 )
    ( on b450 b252 )
    ( on b189 b450 )
    ( on b138 b189 )
    ( on b144 b138 )
    ( on b458 b144 )
    ( on b391 b458 )
    ( on b376 b391 )
    ( on b626 b376 )
    ( on b52 b626 )
    ( on b766 b52 )
    ( on b594 b766 )
    ( on b757 b594 )
    ( on b385 b757 )
    ( on b701 b385 )
    ( on b321 b701 )
    ( on b593 b321 )
    ( on b959 b593 )
    ( on b821 b959 )
    ( on b26 b821 )
    ( on b426 b26 )
    ( on b703 b426 )
    ( on b638 b703 )
    ( clear b638 )
  )
  ( :goal
    ( and
      ( clear b608 )
    )
  )
)
