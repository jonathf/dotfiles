

def read_h5_as_frame(filename):
    """Open an h5py file and load all columns into a dataframe."""
    with h5.File(filename, "r") as handle:
        frame = pd.DataFrame({key: handle[key][:] for key in handle})
    return frame

def write_frame_as_h5(frame, filename):
    """Open an h5py file and load all columns into a dataframe."""
    with h5.File(filename, "w") as handle:
        for name in frame.columns:
            if frame[name].dtype == "O":
                handle.create_dataset(name, data=frame[name].values.astype("S"),
                                      compression="gzip", compression_opts=9)
            else:
                handle.create_dataset(name, data=frame[name].values,
                                      compression="gzip", compression_opts=9)
